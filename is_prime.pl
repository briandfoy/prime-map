#!/usr/bin/perl
use strict;
use warnings;

use File::Map qw(map_file);

my $file = 'prime_map.dat';

die "usage: $0 NUMBER [NUMBER ...]\n" unless @ARGV;

map_file my $map, $file, '<';

my $BITS = 8 * length($map);

foreach my $number (@ARGV) {
	unless ($number =~ /\A[0-9]+\z/ && $number < $BITS) {
		warn "Skipping invalid number: $number\n";
		next;
		}

	printf "%s is %s\n",
		$number,
		vec($map, $number, 1) ? 'prime' : 'not prime';
	}
