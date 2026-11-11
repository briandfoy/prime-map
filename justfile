data_file := "prime_map.dat"
packed_file := "primes_packed.dat"

# List the available recipes
help:
	@just --list

# Delete the data file, then build it from scratch
build: delete
	time perl make_prime_map.pl {{data_file}}

# Convert the bit map to primes packed as 32-bit network order integers
packed:
	time perl map_to_packed.pl {{data_file}} {{packed_file}}

# Delete the data file
delete:
	rm -f {{data_file}}
