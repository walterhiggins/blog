#!/usr/bin/perl
use strict;
use lib "lib";

use Sxoop::TinyMake ':all';
use Sxoop::TinyTemplate ':all';
use Sxoop::PTParser ':all';
use Data::Dumper qw(Dumper);
use CGI ':standard';
$Sxoop::TinyMake::VERBOSE = 0;

my $query = new CGI();

my @targets = $query->param('targets') ;
@targets = ("all") if (!@targets);
our @posts = glob("../posts/*.md");
our $CACHE_DIR = "cache";

#
# update index if any posts changed.
#
our $BLOG         = {};
file "index.data" => \@posts,           \&update_index_data;
make "index.data";
read_index_data();
#
# make sure info for all posts has been loaded.
#
map { die "No post info for $_" unless exists ($BLOG->{$_}) } @posts;

my @categories = get_categories();

our @posts_sorted_chron  = blogsort( @posts );

our @recent_atom         = grep /.+/, (@posts_sorted_chron[0..9]);
our @recent_html         = grep /.+/, (@posts_sorted_chron[0..19]);
our @archived_posts      = grep /.+/, (@posts_sorted_chron[0..$#posts_sorted_chron]);
my %txt2markdown         = map {  path_md($_) => [$_]} @posts;
my %markdown2page        = map { "../" . $BLOG->{$_}->{html} => ["templates/page.html", path_md($_), $_]} @posts;

my %hcat = map {+ "../cat-index-$_.html" => ["templates/archive.html", "templates/archive.html", get_posts_by_category($_)]} @categories;

our @rebuilt = ();

file  "clean"        => [],                \&clean;
group "markdown"     => \%txt2markdown,    \&build_markdown;
group "html_pages"   => \%markdown2page,   \&build_page;
group "categories"   => \%hcat,            \&build_archive;
file  "../index.html"   => ["templates/index.html",   @recent_html],   \&build_index;
file  "../archive.html" => ["templates/archive.html", "index.data", @archived_posts], \&build_archive;
file  "../atom.xml"     => ["templates/atom.xml",     @recent_atom],   \&build_atom;
file  "all"          => [qw(categories index.data markdown ../index.html ../archive.html html_pages ../atom.xml)];

map { make $_ } @targets ;


print "Content-type: text/html\n\n";
eval include "templates/rebuilt.html";
if ($@){ print "ERROR evaluating templates/rebuilt.html $@"};

sub clean
{
    my @html = glob ("../*.html");
    if (@html) {
        unlink @html or die "Cant remove *.html $!\n";
    }
    if (-e "index.data"){
        unlink "index.data" or die "Cant remove index.data $!\n";
    }
    my @scratch = glob("$CACHE_DIR/*.markdown.html");
    if (@scratch){
        unlink @scratch or die "Can't remove $CACHE_DIR/*.markdown.html $!\n";
    }
    if (-e "../atom.xml"){
        unlink "../atom.xml" or die "Cant remove atom.xml $!\n";
    }
}
sub build_markdown
{
    my $cmd = "perl org-mode-to-markdown.pl < \"$changed[0]\" | perl Markdown.pl > $target";
    `$cmd`;
    if ($?){
        die "Error: $? while executing $cmd\n";
    }
}
#
# Build the syndication feed.
# 
sub build_atom
{
    my @recent_info = map { $BLOG->{$_} } @sources[1..$#sources];
    
    my @time   = localtime(time());
    my $now    = {year => $time[5] + 1900, month => $time[4] + 1, day => $time[3],
                  hour => $time[2],        minute => $time[1],    second => $time[0]};
    my $page = {
        now => sprintf("%04d-%02d-%02dT%02d:%02d:%02dZ",
                       $time[5]+1900,
                       $time[4]+1,
                       $time[3],
                       $time[2],$time[1],$time[0]),
        recent => \@recent_info,
    };
    open (ATOM, ">$target") or die "build_atom can't write target file [$target] $!\n";
    select ATOM;
    
    eval include $sources[0];
    die "error parsing $sources[0] $@" if ($@);
    
    close ATOM;
    push (@rebuilt, $target);
    
    select STDOUT;
}
sub build_archive
{
    #
    # sources = [template, "index.data", @posts]
    #            0         1,            2..
    #
    my @monthnames = ("January","February","March","April","May","June","July","August","September",
                      "October","November","December");
    my $years = {};
    foreach (@sources[2..$#sources])
    {
        my $post = $BLOG->{$_};
        my ($year, $month, $day) = $post->{date} =~ /(.{4})-(.{2})-(.{2})/;
        if (exists $years->{$year}){
            if (exists $years->{$year}->{$month}){
                push @{$years->{$year}->{$month}}, $post;
            }
            else{
                $years->{$year}->{$month} = [$post];
            }
        }else {
            $years->{$year} = {$month=>[$post]};
        }
    }
    
    open (TARGET, ">$target") or die "build_archive cant write [$target] $!\n";
    select TARGET;
    
    my $page = {
        title => "Archive",
        years => $years,
        monthnames => \@monthnames,
    };
    eval include $sources[0];
    die "error parsing $sources[0] $@" if ($@);
    
    close TARGET;
    push (@rebuilt, $target);
    
    select STDOUT;
}

#
# build a individual blog post page
#
sub build_page
{
    #
    # sources = [template, markdown, plaintext]
    #            0         1         2
    #
    my $title = $BLOG->{$sources[2]}->{title};
    open MD, "<$sources[1]" or die "build_page cant read markdown file [$sources[1]] $!\n";
    my @md = <MD>;
    close MD;

    my $body_text = join ('',@md);
    my $page = {
        url     => $target, 
        title   => $title,
        text    => $body_text,
        sources => \@sources,
    };
    # wph 20120218 - built from admin dir now
    $page->{url} =~ s/^\.\.\///;
    # wph 20120229 - use MultiViews in directory options so no need to include .html
    $page->{url} =~ s/\.html$//;
    foreach (@{$page->{sources}}){
        $_ =~ s/^\.\.\///;
    }

    open (TARGET, ">$target") or 
        die "build_page could not write target file [$target] $!\n" .
        "No target for post $sources[2]\n";
    select TARGET;
    
    eval include ($sources[0]);
    die "error in $sources[0] $@\n" if $@;
    
    close TARGET;
    push (@rebuilt, {target=>$target,changed=>$sources[2]});
    select STDOUT;
}
#
# Build main index page.
#
sub build_index
{
    open (TARGET, ">$target") or die "build_index cant write target file [$target] $!\n";
    select TARGET;
    
    my @texts = ();
    
    foreach (@sources[1..$#sources])
    {
        my @text = read_markdown($_);

        add_title_link($BLOG->{$_},\@text);
        push @texts, join ('', @text);
    }

    my $page = {
        title => "Index",
        texts => \@texts,
    };
    eval include $sources[0];
    die "error in $sources[0] $@\n" if ($@);
    
    close TARGET;
    push (@rebuilt, $target);
    select STDOUT;
}
# ------------------------------------------------------------------------
# supporting subroutines
# ------------------------------------------------------------------------
#
# sort in reverse chronological order
#
sub blogsort
{
    sort { $BLOG->{$b}->{date} cmp $BLOG->{$a}->{date} } @_;
}
#
# return the path to the markdown text for a post
# e.g 
sub path_md
{
    my ($md) = @_; 
    $md =~ s/\.\.\/posts\/(.*)\.md$/$CACHE_DIR\/$1.markdown.html/g;
    $md =~ s/[\(\) ]//g;
    return $md;
}

sub read_markdown
{
    my ($post) = @_;
    my ($md_path) = path_md($post);
    open MD, "<$md_path" or die "cant read markdown file [$md_path] $!\n";
    my @md = <MD>;
    close MD;
    return @md;
}
sub read_index_data
{
    if (-e "index.data"){
        open (INDEX, "<index.data") or die "Cant read index.data $!\n";
        my $contents = join '', <INDEX>;
        close INDEX;
        $BLOG = do { no strict 'vars'; eval ($contents)};
    }
}
sub get_categories
{
    my %seen = ();
    foreach (keys %$BLOG){
        my $pi = $BLOG->{$_};
        my $c = $pi->{categories};
        foreach (@$c){
            $seen{$_}++;
        }
    }
    return keys %seen;
}
sub get_posts_by_category
{
    my ($cat) = @_;
    my @result = ();
    foreach (keys %$BLOG){
        my $pi = $BLOG->{$_};
        if (grep /^$cat$/, @{$pi->{categories}}){
            push @result, $pi->{filename};
        }
    }
    return blogsort(@result);
}
sub update_index_data
{
    read_index_data();

    foreach (@changed) {
        $BLOG->{$_} = read_post($_);
    }

    open INDEX, ">index.data" or die "Can't write index.data $!\n";
    select INDEX;
    print Dumper($BLOG);
    close INDEX;
    select STDOUT;
}

sub add_title_link
{
    my ($pi, $text) = @_;
    $text->[0] =~ s|<h1 class="title">(.*)</h1>|<h1 class="title"><a href="$pi->{url}">$1</a></h1>|;
}
sub add_category_links 
{
    my ($pi,$text) = @_;
    my @a = @$text;
    foreach (0..$#a){
        if ($text->[$_] =~ /^\<h2>categor/i)
        {
            my $cat_line = $text->[$_+2];
            foreach my $phrase (keys %{$pi->{category_links}}){
                my $link = $pi->{category_links}->{$phrase};
                $cat_line =~ s/$phrase/\<a href=\"cat-index-$link\">$phrase\<\/a>/;
            }
            $text->[$_+2] = $cat_line;
        }
    }
}
