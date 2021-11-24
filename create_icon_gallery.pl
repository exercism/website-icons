#!/usr/bin/env perl

use File::Basename;

print "# Gallery of SVGs in this folder\n";
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

