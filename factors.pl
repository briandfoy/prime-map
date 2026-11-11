#!perl
use v5.42;

@ARGV = qw(1024);

foreach my $i ( qw(17 38 94 137) ) {
	say "is_prime($i): " . is_prime($i);
	}


use List::Util qw(max);
my $n = $ARGV[0];
my @factors =
	grep { $n % $_ == 0 }
	grep { is_prime($_) }
	( 2 .. $n );
say "$n -> @factors";
say max(@factors);

sub is_prime ($i) {
	return 1 if $i == 2;
	my @c = grep { $i % $_ == 0 } 2 .. sqrt($i);
	return @c ? 0 : 1;
	}
