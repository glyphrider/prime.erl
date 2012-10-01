# Prime Numbers
## and Prime Factorization

To compile the erlang code into a beam file

	erlc prime.erl

or

	erl
	1> c(prime).

then

	2> prime:prime(37).
	true
	3> prime:factors(8).
	[2,2,2]

To run unit tests (eunit):

	erlc -DTEST prime.erl
	erl prime:test().

There's also a handy **Makefile** that automates all of the above

	make
