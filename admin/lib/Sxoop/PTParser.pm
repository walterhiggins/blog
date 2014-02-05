package Sxoop::PTParser;
use strict;
use LWP::Simple;
use LWP::UserAgent;
use JSON;

our $VERSION = '0.01';
require Exporter;


our @ISA = ("Exporter");
our @EXPORT_OK = qw(parse_pt read_post sanitize_title scrub get_h1 get_date);
our %EXPORT_TAGS = (all => \@EXPORT_OK,);

sub get_h1
{
	my ($line) = @_;
	# org-mode header
	if ($line =~ /^\* (.+)/){
		return scrub($1);
	}
	# markdown header
	if ($line =~ /^\# (.+)/){
		my $h = $1;
		$h =~ s/ \#$//;
		return scrub($h);
	}
	return 0;
}
sub get_date 
{
	my ($line) = @_;
	# first 2-level heading with numeric pattern is date
	if ($line =~ /^\*\* ([0-9\/ \:]+)/){
		return $1;
	}
	# markdown first 2-level heading with numeric pattern is date
	if ($line =~ /^\#\# ([0-9\/ \:]+)/){
		return $1;
	}
	return 0;
}
sub parse_pt
{
    my ($result, @content) = @_;
    foreach (0..$#content)
    {
        my $line = $content[$_];
        # first 1-level heading is title

		my $h1 = get_h1($line);
		# org-mode header
		if ($h1 && ! $result->{title}){
			$result->{title} = $h1;
		}
		my $date = get_date($line);
		if ($date && ! $result->{date}){
			$result->{date} = sprintf("%d-%02d-%02dT%02d:%02d:00Z", (split /\D/, $date));
		}

        # categories
        if ($line =~ /^[\*\#]{2} categor/i && ! $result->{categories})
		  {
				my $offset = 1;
				while (1){
					 if ($content[$_+$offset] =~ /^\*/){
						  last;
					 }
					 if ($_+$offset > $#content){
						  last;
					 }
					 if ($content[$_+$offset] =~ /.+/){
						  my @catWords = split / *, */, $content[$_+$offset];
						  $result->{category_links} = {map {my $w = $_; s/\s+/-/g; $w => lc $_} @catWords };
						  $result->{categories} = [values %{$result->{category_links}}];
						  last;
					 }
					 $offset += 1;
				}
        }
    }
	 my $fname = sanitize_title($result->{title});
	 if ( ! $result->{filename}){
		  #
		  # this is a new post
		  # need to ensure we don't overwrite an existing post.
		  #
		  if (-e "../posts/$fname.txt"){
				my $i = 1;
				while (1){
					 if (-e "../posts/$fname-$i.txt"){
						  $i = $i +1;
					 }else{
						  $fname.= "-$i";
						  last;
					 }
				}
		  }
		  $result->{filename} = "../posts/$fname.txt";
	 }
	 if ( ! $result->{html}){
		  $result->{html} = "$fname.html";
	 }
}
sub scrub 
{
	 # convert & to &amp; and < to &lt;
	 my ($t) = @_;
	 $t =~ s/&/&amp;/g;
	 $t =~ s/</&lt;/g;
	 return $t;
}
sub read_post
{
    my ($post) = @_;
    open (POST, "<$post") or die "can't read post $post $!\n";
    my @content = <POST>;
    close POST;
	@content = split /[\n\r]/, join '',@content;
    my $result = { filename => $post };
    $post =~ /\/posts\/(.*)txt$/;
    $result->{html} = "$1html";
	$result->{url} = $1;
	$result->{url} =~ s/\.$//;

	parse_pt( $result, @content);
    $result;
}

sub sanitize_title
{
	 my ($title) = @_;
	 $title =~ s/(\W+)/-/g;
	 $title =~ s/-$//;
	 $title =~ s/^-//;
	 return $title;
}
#
# convert a markdown blockquote to a tweet.
# returns the tweet markup if successful or "" if unsuccessful.
# if unsuccessful, should fallback to using regular markdown
#
sub tweet
{
    my ($statusid) = @_;
    my $jsonfile = "cache/tweet_$statusid.json";
    unless (-e $jsonfile){
        #
        # the tweet file does not already exist,
        # download it from twitter.
        #
        my $ua = LWP::UserAgent->new();
        my $response = $ua->get("http://api.twitter.com/1/statuses/show/$statusid.json?include_entities=1");
        if ($response->is_success){
            open (JSON, ">$jsonfile") or die "Can't write $jsonfile because $!\n";
            print JSON $response->content;
            close JSON;
        }
    }
    return "" unless (-e $jsonfile);
    open (JSON, "<$jsonfile") or die "Can't read $jsonfile because $!\n";
    my $rawjsontext = join '', <JSON>;
    close JSON;
    my $json = from_json($rawjsontext);
    my $user = $json->{'user'}->{'screen_name'};
    my $avatar = get_twitter_image($user);
    return ($json,$avatar);
}

sub get_twitter_image
{
	 my ($user) = @_;
	 my @avatars = glob("../images/twitter/*");
	 foreach (@avatars){
		  if (/$user\./){
			  my ($image) = $_ =~ /\.\.\/(.*)/;
			  return $image;
		  }
	 }
	 my $ua = LWP::UserAgent->new();
	 my $response = $ua->get("http://api.twitter.com/1/users/show/$user.json");
	 if ($response->is_success){
		  my $json = $response->content;
		  my $userobj = from_json($json);
		  
		  my $profile_image = $userobj->{profile_image_url};

		  my $data = get($profile_image);
		  
		  my ($ext) = $profile_image =~ /(\.[a-zA-Z]+)$/;
		  
		  open (IMAGE, ">../images/twitter/$user$ext") or die "can't write image ../images/twitter/$user$ext $!\n";
		  
		  binmode (IMAGE);
		  print IMAGE $data;
		  close IMAGE;
		  return "images/twitter/$user$ext";
	 }else{
		  return "images/twitter/default.png";
	 }
}
sub tweetexpandnames
{
	 my ($json, $encoded) = @_;
	 my $text = $encoded;
	 foreach (@{$json->{'entities'}->{'user_mentions'}})
	 {
		  my $user = $_->{'screen_name'};
		  my $intweet = "@" . $user;
		  my $url = "<a href=\"http://twitter.com/$user/\">$intweet</a>";
		  $text =~ s/$intweet\b/$url/g;
	 }
	 return $text;
}
sub tweetexpandurls
{
	 my ($json,$encoded) = @_;
	 my $text = $encoded;
	 foreach (@{$json->{'entities'}->{'urls'}})
	 {
		  my $url = $_->{'url'};
		  my $expanded = $_->{'expanded_url'};
		  my $display = $_->{'display_url'};
		  my $href = "<a href=\"$expanded\">$display</a>";
		  $text =~ s/$url/$href/g;
	 }
	 return $text;
}

1;
