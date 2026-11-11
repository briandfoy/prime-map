#!/usr/bin/perl
use v5.38;

use File::Map qw(map_file);

is_prime(@ARGV) unless caller;

sub is_prime (@args) {
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
	}


