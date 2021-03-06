# Perl Goodies ~ LineWalk.pm Recursively search/replace text in files.

## 2012/01/11 14:49

I've been using this module for quick-fixes on xml files but this is just a line-based editor. 

    package LineWalk;
    use strict;
    our $version = '0.01';
    #
    # USAGE: Can be used to recursively (directories) search or replace text in files.
    # 
    # use LineWalk ':all';
    # sub edit {
    #   my ($index, $lines, $filename) = @_;
    #   $lines->[$index] =~ s/foo/bar/;
    # }
    # sub match {
    #   my $filename = shift;
    #   return $filename =~ /\.txt$/;
    # }
    # replace all occurences of 'foo' with 'bar' for any
    # .txt file in the specified directory or subdirs.
    # LineWalk::edit ($ARGV[0], \&match, \&edit);
    #
    use File::Find;
    use Digest::MD5 qw(md5 md5_hex);
    
    require Exporter;
    our @ISA = ("Exporter");
    
    our @EXPORT_OK = qw(edit delete_block get_block);
    our %EXPORT_TAGS = (all => \@EXPORT_OK);
    
    our $matched = 0;
    our $edit_line = 0;
    our @lines = ();
    our $index = 0;
    
    sub edit 
    {
    	 my $path = shift;
    	 $matched = shift;
    	 $edit_line = shift;
    	 find (\&file_visit, $path);
    }
    
    sub file_visit
    {
    	 my $filename = $File::Find::name;
    	 return unless ($matched->($filename));
    
    	 open (FILE, "<$filename") or die "Can't open file $filename $!\n";
    	 @lines = <FILE>;
    	 close FILE;
    	 my $before = md5_hex(join '', @lines);
    	 foreach $index (0..$#lines){
    		  $edit_line->($index,\@lines,$filename);
    	 }
    	 my $after = md5_hex(join '', @lines);
    	 if ($before ne $after){
    		  print "Updated $filename\n";
    		  open (FILE, ">$filename") or die "Can't write file $filename $!\n";
    		  select FILE;
    		  print @lines;
    		  close FILE;
    		  select STDOUT;
    	 }
    }
    sub get_block
    {
    	 my ($start, $end) = @_;
    	 my $done = 0;
    	 my $offset = 0;
    	 my ($s,$e) = $index;
    	 # 
    	 # search backwards 
    	 #
    	 while (!$done)
    	 {
    		  if ($lines[$index-$offset] =~ /$start/)
    		  {
    				$done = 1;
    				$s = $index - $offset;
    		  }
    		  $offset++;
    	 }
    	 $done = 0;
    	 $offset = 0;
    	 #
    	 # search forward
    	 #
    	 while (! $done){
    		  if ($lines[$index+$offset] =~ /$end/)
    		  {
    				$done = 1;
    				$e = $index + $offset;
    		  }
    		  $offset++;
    	 }
    	 return ($s,$e);
    }
    sub delete_block 
    {
    	 my ($start, $end) = @_;
    	 my $done = 0;
    	 my $offset = 0;
    	 # 
    	 # search backwards 
    	 #
    	 while (!$done)
    	 {
    		  if ($lines[$index-$offset] =~ /$start/)
    		  {
    				$done = 1;
    		  }
    		  $lines[$index-$offset] = '';
    		  $offset++;
    	 }
    	 $done = 0;
    	 $offset = 0;
    	 #
    	 # search forward
    	 #
    	 while (! $done){
    		  if ($lines[$index+$offset] =~ /$end/)
    		  {
    				$done = 1;
    		  }
    		  $lines[$index+$offset] = '';
    		  $offset++;
    	 }
    }
    
    1;
    
## Categories

Perl, Tools, Search, Files
