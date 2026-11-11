#!/usr/bin/perl
use v5.42;
use autodie;

use File::Map qw(map_handle sync);
use Math::Prime::Util qw(next_prime);

my $MAX   = 0xFFFF_FFFF;
my $BYTES = ($MAX + 1) / 8;    # 512 MiB

my $file = $ARGV[0] // 'prime_map.dat';

open my $fh, '+>>:raw', $file;

my $size = -s $fh;
die "$file is $size bytes, expected 0 or $BYTES\n"
	unless $size == 0 || $size == $BYTES;
truncate $fh, $BYTES if $size == 0;
map_handle my $map, $fh, '+<';

for (my $prime = 2; $prime < $MAX; $prime = next_prime($prime)) {
	vec($map, $prime, 1) = 1;
	}

sync($map);
