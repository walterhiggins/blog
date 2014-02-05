#!/usr/bin/perl
use strict;

use CGI ':standard';
use lib "lib";
use Sxoop::PTParser ':all';
use Sxoop::TinyTemplate ':all';
use Sxoop::TinyMake ':all';
use HTML::Entities;

$Sxoop::TinyMake::VERBOSE = 0;

my $query = new CGI();
my $action = $query->param('action') || 'list_posts';

my $action_map = { 
	 'new_post'   => \&new_post,
	 'edit_post'  => \&edit_post,
	 'edit_file'  => \&edit_file,
	 'delete_file'  => \&delete_file,
	 'list_posts' => \&list_posts,
	 'delete'     => \&delete_post,
};

$action_map->{$action}->($query);

sub display_error
{
	my ($query,$error) = @_;
	list_posts($query,$error);
}
sub edit_file 
{
	my ($query) = @_;
	my $filename = $query->param('filename');
	my $text = $query->param('text');

	unless ($text){
		open (FILE, "<$filename") or return display_error($query,"edit_file: Can't read $filename because $!\n");
		my $contents = join '', <FILE>;
		close FILE;
		$contents =~ s/\r\n/\n/g;
		print "Content-type: text/html\n\n";
		eval include "templates/admin_edit_file.html";
	}else{
		# save the file
		open (FILE, ">$filename") or return display_error($query,"edit_file: Can't write $filename because $!\n");
		print FILE $text;
		close FILE;
		print redirect("index.pl");
	}
	
}
sub delete_post
{
	 my ($query)  = @_;
	 my $post = $query->param('post');
	 unlink $post or return display_error($query, "delete_post: Cant delete $post $!\n");
	 print redirect("index.pl");

}
sub delete_file
{
	 my ($query)  = @_;
	 my $filename = $query->param('filename');
	 unlink $filename or return display_error($query, "delete_file: Cant delete $filename $!\n");
	 print redirect("index.pl");

}
sub list_posts
{
	my ($query,$error) = @_;
    my @posts =  glob ("../posts/*.txt");
	my @posts_info = sort { $b->{date} cmp $a->{date} } map { read_post($_) } @posts;

	print "Content-type: text/html\n\n";
	eval include "templates/admin_ui.html";
	if ($@){print "ERROR: $@";}
}

sub edit_post
{
	 my ($query) = @_;
	 my $post = $query->param('post');
	 open (POST, "<$post") or return display_error($query, "edit_post: cant read $post $!\n");
	 my $contents = join '', <POST>;
	 $contents =~ s/\r/\n/g;
	 close POST;
	 print "Content-type: text/html\n\n";
	 eval include "templates/admin_edit.html";
}
sub preview_post
{
    my ($query) = @_;
    new_post($query);
}
sub new_post
{
	 my ($query) = @_;
	 my $text = $query->param('text');
	 foreach my $index (1..8)
	 {
		  my $filename = $query->param("file" . $index);
		  if (! $filename){

				last;
		  }
		  my $fh = $query->upload("file" . $index);
		  if ($fh)
		  {
				my $dir = "files";
				
				$filename = (split /[\/\\]/, $filename)[-1];
				my $sanitized = $filename;
				$sanitized =~ s/\s+/-/g;
				$sanitized =~ s/\.pl$/\.pl\.txt/;
				$sanitized =~ s/\.php$/\.php\.txt/;
				$sanitized =~ s/\.cgi$/\.cgi\.txt/;

				#
				# fix refs in text
				#
				$text =~ s/$filename/$sanitized/g;

				$filename = $sanitized;

				if ($filename =~ /.jpe*g$/i || $filename =~ /.png/i || $filename =~ /.gif/i){
					 $dir = "images";
				}
				if ($filename =~ /.mp3$/i || $filename =~ /.aac/i || $filename =~ /.flac/i){
					 $dir = "sounds";
				}
				my $bin = 0;
				open (UPLOAD, ">../$dir/$filename") or return display_error($query, "new_post: Cant write file ../$dir/$filename $!\n");
				if ($dir eq "images" or $dir eq "sounds")
				{
					 binmode UPLOAD;
					 $bin = 1;
				}
				while (<$fh>){
					 
					 $_ =~ s/\r\n/\n/g unless $bin;

					 print UPLOAD;
				}
				close UPLOAD;

		  }
		  
	 }
	 $text = scrub_non_ascii($text);
	 my @lines = split /\n/, $text;
	 my $filename = $query->param('filename');
	 my $href = {filename => $filename};
	 parse_pt($href, @lines);
	 open (POST, ">$href->{filename}") or return display_error($query, "new_post: cant write file $href->{filename} $!\n");
	 print POST @lines;
	 close POST;
     if ($query->param('preview')){
         my $filename = $query->param('filename');
         $filename =~ s/posts\///g;
         $filename =~ s/\.txt/\.html/g;
         print redirect("makefile.pl?targets=$filename");
     }else{
         print redirect("index.pl");
     }
}

sub scrub_non_ascii
{
	my ($text) = @_;
	$text = HTML::Entities::encode_entities($text,"\200-\377");
#	$text =~ s/([\200-\377])/'&#'.ord($1).';'/eg;
	return $text;
}
