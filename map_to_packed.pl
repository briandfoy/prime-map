#!/usr/bin/perl
use v5.38;

use File::Map qw(map_file);

my( $in_file, $out_file ) = @ARGV;
die "usage: $0 BIT_MAP_FILE OUTPUT_FILE\n" unless defined $out_file;

map_file my $map, $in_file, '<';

# for each possible byte value, the offsets of its set bits, in the
# same bit order that vec($map, $n, 1) uses
my @offsets = map {
	my $byte = $_;
	[ grep { $byte & (1 << $_) } 0 .. 7 ]
	} 0 .. 255;

open my $out_fh, '>:raw', $out_file
	or die "Could not open $out_file: $!\n";

my $bytes = length $map;
for( my $i = 0; $i < $bytes; $i++ ) {
	my $byte = vec( $map, $i, 8 ) or next;
	my $base = $i << 3;
	print {$out_fh} pack 'N*', map { $base + $_ } $offsets[$byte]->@*;
	}

close $out_fh or die "Could not close $out_file: $!\n";
