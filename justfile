data_file := "prime_map.dat"

# List the available recipes
help:
	@just --list

# Delete the data file, then build it from scratch
build: delete
	time perl make_prime_map.pl {{data_file}}

# Delete the data file
delete:
	rm -f {{data_file}}
