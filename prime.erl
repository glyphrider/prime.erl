-module(prime).
-export([prime/1,factors/1]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

prime(N,M) when N == M -> true;
prime(N,M) when N rem M == 0 -> false;
prime(N,M) -> prime(N,M+1).

prime(N) when N < 2 -> false;
prime(N) when N rem 1 == 0 -> prime(N,2).

factors(N,M,L) when N == M -> [M|L];
factors(N,M,L) when N < M -> L;
factors(N,M,L) when N rem M == 0 -> factors(N div M,M,[M|L]);
factors(N,M,L) -> factors(N,M+1,L).

% list is build in decending order, so reverse it
factors(N) -> lists:reverse(factors(N,2,[])).

-ifdef(EUNIT).
one_is_not_prime_test() -> false = prime(1).
two_is_prime_test() -> true = prime(2).
three_is_prime_test() -> true = prime(3).
four_is_not_prime_test() -> false = prime(4).
five_is_prime_test() -> true = prime(5).
six_is_not_prime_test() -> false = prime(6).
seven_is_prime_test() -> true = prime(7).
eight_is_not_prime_test() -> false = prime(8).
nine_is_not_prime_test() -> false = prime(9).
ten_is_not_prime_test() -> false = prime(10).

prime_factors_of_one_test() -> [] = factors(1).
prime_factors_of_six_test() -> [2,3] = factors(6).
prime_factors_of_eight_test() -> [2,2,2] = factors(8).
prime_factors_of_twofiftysix_test() -> [2,2,2,2,2,2,2,2] = factors(256).
prime_factors_of_thirty_test() -> [2,3,5] = factors(30).
prime_factors_of_sixty_test() -> [2,2,3,5] = factors(60).
-endif.
