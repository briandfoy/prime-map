# A Prime Factor Map

The programs and other scraps I mention in a blog article.

## Clone without the big files

	$ GIT_LFS_SKIP_SMUDGE=1 git clone <repo-url>

Grab the large file later (although you can just make themself)

	$ git lfs pull --include="prime_map.dat"

## Generate the data

The *justfile* has targets for everything.

	$ just
	Available recipes:
		build  # Delete the data file, then build it from scratch
		delete # Delete the data file
		help   # List the available recipes
		packed # Create a packed int data file, in network order

Build the map:

	$ just build

Then try it:

	$ perl is_prime.pl 137
	137 is prime

	$ perl is_prime.pl 1024
	1024 is not prime

## Some large files:

These are in LFS, so if you check out these files, you may get them in two or more places.

* *prime_map.dat* (512MB) - the output of `just build`. You can create this yourself in a couple minutes.
* *primtes-32bits.txt.gz* (495MB zipped, 2+GB unzipped) - all primes under 2^32 as strings.
* *primes_packed.dat.gz* (492MB zipped, 775MB unzipped) - all primes under 2^32 as packed ints in network order.
