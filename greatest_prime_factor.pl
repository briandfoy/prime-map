#!perl
use v5.10;
use List::Util qw(max);
use Math::Prime::Util qw(factor);
say max(factor($ARGV[0]));
