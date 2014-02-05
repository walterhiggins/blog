#!/usr/bin/perl
use strict;
use Getopt::Std;
#use LWP::Simple;
#use LWP::UserAgent;
#use JSON;
use lib "lib";
use Sxoop::PTParser ':all';
use Sxoop::TinyTemplate ':all';
use Sxoop::TinyMake ':all';
use HTML::Entities;
$Sxoop::TinyMake::VERBOSE = 0;

main();

sub main 
{
    my $start = time();
    my %opt = ();
    
    getopts('f',\%opt);
    
    my @lines;
    my $all;
    if ($opt{f}){
	my $fname = shift;
	open (FILE, "<$fname") or die "cant open $fname $!\n";
	$all = join '', <FILE>;
	close FILE;
    }else{
	$all = join '', <STDIN>;
    }
    @lines = split /[\n\r]/, $all;
    foreach (0..$#lines){
	next if $lines[$_] eq '';
	next if convert_headers($_,\@lines);
	next if do_youtube($_,\@lines);
	next if do_twitter($_,\@lines);
	next if do_twitter_shortcode($_,\@lines);
	next if do_bandcamp($_,\@lines);
	next if do_sounds($_,\@lines);
    }
    my $end = time();
    push @lines, "<!-- pre-markdown processing for this page took " . ($end - $start) . " seconds -->";
    print join "\n", @lines;
}


#
# convert org-mode headers to markdown headers
#
sub convert_headers
{
    my ($i,$t) = @_;
    if ($t->[$i] =~ /^(\*{1,})\s(.*)/){
	my $text = $2;
	my $h = $1;
	$h =~ s/./\#/g;
	$t->[$i] = "$h $text $h";
    }
    my $h1 = get_h1($t->[$i]);
    my $date = get_date($t->[$i]);
    if ($h1){
	$t->[$i] = "<h1 class=\"title\">$h1</h1>";
    }elsif ($date){
	$t->[$i] = "<h2 class=\"timestamp\">$date</h2>";
    }elsif ($t->[$i] =~ /^\#\# categor/i ){
	my $cat_line = $t->[$i+1];
	my @links = 
	    map { 
		my $o = $_; 
		s/\s+/-/g; 
		my $l = lc $_;
		"<a href=\"cat-index-$l\">$o</a>" 
	} 
	split /\,\s+/,$cat_line;
	$t->[$i] = "<h2 class=\"categories\">Categories</h2><div class=\"categories\">";
	$t->[$i+1] = join ", ", @links;
	$t->[$i+1] .= "</div>";
    }
    return 0;
}
#
# convert bandcamp links to embeds
#
sub do_bandcamp
{
    my ($i,$t) = @_;
    if ($t->[$i] =~ /\[(.*)\]\((http:\/\/bandcamp.com\/EmbeddedPlayer\/.+)\)/)
    {
	$t->[$i] =<<"BANDCAMP";
<iframe width="400" 
    height="100" 
    style="position: relative; display: block; width: 400px; height: 100px;" 
    src="$2" 
    allowtransparency="true" 
    frameborder="0">
$1
</iframe>
BANDCAMP
;
	return 1;
    }
    return 0;
}

#
# Youtube links get turned into iframes
#
sub do_youtube
{
    my ($i,$t) = @_;
    if ($t->[$i] =~ /\[(.*)\]\(http:\/\/youtu\.be\/([a-zA-Z\-_0-9]*)\)/)
    {
	$t->[$i] =<<"IFRAME";
<iframe width="560" height="315" title="$1" src="http://www.youtube.com/embed/$2" 
	    frameborder="0" allowfullscreen>
      <p><a href="http://youtu.be/$2">$1</a></p>
</iframe>
IFRAME
;
		return 1;
	}
	return 0;
}
#
# convert sound links to <audio> elements
#
sub do_sounds
{
    my ($i,$t) = @_;
    if ($t->[$i] =~ /\[(.*)\]\((sounds\/.*)\)/)
    {
	$t->[$i] =<<"AUDIO";
<audio src="$2" controls="controls">
<a href="$2">Download $1</a>
</audio>
AUDIO
;
	return 1;
    }
    return 0;
}
# it's a tweet!
# go back to start of blockquote, grab all quoted text.
# insert a table with the twitter user's icon on the left and text on the right.
#
sub do_twitter
{
    my ($i,$t) = @_;
    if ($t->[$i] =~ /^> [-]*\s*\[(.*)\]\(https?:\/\/twitter.com(\/\#!)*\/(.+)\/status\/([0-9]+)/)
    {
	#
	my $statusid = $4;
	my ($json,$avatar) = Sxoop::PTParser::tweet($statusid);
	if ($json){
	    # was able to get tweet info from twitter.
	    # don't use the markdown.
	    my $j = $_;
	    while ($t->[$j] =~ /^>/){
		$t->[$j--] = '';
	    }
	    $t->[$i] = tweetquote($json,$avatar);
	    return 1;
	}
    }
    return 0;
}
sub do_twitter_shortcode
{
    my ($i,$t) = @_;
    if ($t->[$i] =~ /^\[tweet https\:\/\/twitter\.com\/.+\/status\/([0-9]+)\]/){
	
	# it's a shortcode for a tweet!
	my $statusid = $1;
	my ($json,$avatar) = Sxoop::PTParser::tweet($statusid);
	if ($json){
	    $t->[$i] = tweetquote($json,$avatar);
	    return 1;
	}
    }
    return 0;
}

sub tweetquote
{
    my ($json,$avatar) = @_;
    my $id = $json->{'id_str'};
	my $partial = "cache/tweet-$id.html";
    file $partial  => ["cache/tweet_$id.json","templates/tweet.html"], sub {
	my $encoded = encode_entities($json->{'text'});
	my $expanded = Sxoop::PTParser::tweetexpandurls($json,$encoded);
	$expanded = Sxoop::PTParser::tweetexpandnames($json, $expanded);
	my $tweet = {
	    expanded => $expanded,
	    avatar => $avatar,
	};
	open (TWEET, ">$target") or die "cant write $target because $!\n";
	select TWEET;
	eval include $sources[1];
	die "Error parsing $sources[1] $@" if ($@);
	close TWEET;
	select STDOUT;
    };
    
    make $partial;
    open (TWEET, "<$partial") or die "cant read $partial because $!\n";
    my $tweethtml = join ('', <TWEET>);
    close TWEET;
    return $tweethtml;
}
