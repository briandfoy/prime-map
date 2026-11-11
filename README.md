# A Prime Factor Map

The programs and other scraps I mention in a blog article.

## Generate the map

The *justfile* has targets for this.

	$ just
	Available recipes:
		build  # Delete the data file, then build it from scratch
		delete # Delete the data file
		help   # List the available recipes

Build the map:

	$ just build

Then try it:

	$ perl is_prime.pl 137
	137 is prime

	$ perl is_prime.pl 1024
	1024 is not prime

## Some large files:

These are in LFS, so if you check out these files you may get them in two or more places.

* *prime_map.dat* (512MB)- the output of `just build`. You can create this yourself in a couple minutes.
* *primtes-32bits.txt.gz* (495MB zipped, 2+GB unzipped) all primes under 2**32 as strings.
