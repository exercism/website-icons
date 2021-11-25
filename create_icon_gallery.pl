#!/usr/bin/env perl

# The intended usage of this script is to generate a markdown file
# containing a gallery of icons in the current folder. Example usage:
# 
# $ cd key-features
# $ ../create_icon_gallery.pl > README.md

use File::Basename;
use Cwd;

print "# " . basename(cwd) . " icons\n";
print "Note this file is auto-generated. To re-generate, run `" . basename $0 . "` in this folder.\n";
print "\n";
print "| | | | | |\n";
print "|:---:|:---:|:---:|:---:|:---:|\n";

my $cnt = 0;
foreach (glob "*.svg")
{
  print "|$_<br />![" . basename($_,".svg") . "]($_)";
  if(($cnt += 1) == 5)
  {
    print "|\n";
    $cnt = 0;
  }
}

print "|\n";

