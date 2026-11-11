#!perl
use v5.42;

foreach ( 2 .. 0xFF_FF_FF_FF ) {
	say if is_prime($_);
	}

sub is_prime ($i) {
	return 1 if $i == 2;
	my @c = grep { $i % $_ == 0 } 2 .. sqrt($i);
	return @c ? 0 : 1;
	}
