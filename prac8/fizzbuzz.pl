is_fizz(X) :- 0 is X mod 3.
is_buzz(X) :- 0 is X mod 5.
is_fizzbuzz(X) :- is_fizz(X), is_buzz(X).

do_print(X) :- is_fizzbuzz(X), write('fizz'); is_fizz(X), write('buzz'); is_buzz(X), write('fizzbuzz'); write(X).

fizzbuzz(100) :-
    do_print(100), nl, !.

fizzbuzz(X) :-
    do_print(X), nl,
    Y is X + 1,
    fizzbuzz(Y).