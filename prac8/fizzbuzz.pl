sauce(tomato).
sauce(pesto).
sauce(lamb).
pasta(ravioli).
pasta(linguini).
pasta(spagghetti).
meal(X, Y) :- pasta(X), sauce(Y);
pasta(Y), sauce(X).

check_fizzbuzz(X) :- is_fizz(X), is_buzz(X), write('fizzbuzz'), nl.
check_fizz(X) :- 0 is X mod 3, write('fizz'), nl.
check_buzz(X) :- 0 is X mod 5, write('buzz'), nl.

do_print(X) :- check_fizzbuzz(X); check_fizz(X); check_buzz(X).

fizzbuzz(100) :-
    write(100), nl, !.

fizzbuzz(X) :-
    do_print(X), nl,
    Y is X + 1,
    fizzbuzz(Y).