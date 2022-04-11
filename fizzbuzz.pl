is_fizz(X) :-
  X mod 3 =:= 0.

is_buzz(X) :-
  X mod 5 =:= 0.

is_fizzbuzz(X) :-
  is_fizz(X),
  is_buzz(X).

fizzbuzz(X) :- is_fizzbuzz(X), write('FizzBuzz'), nl.
fizzbuzz(X) :- is_fizz(X), write('Fizz'), nl.
fizzbuzz(X) :- is_buzz(X), write('Buzz'), nl.
fizzbuzz(X) :- write(X), nl.

main :-
  between(1, 100, X),
  fizzbuzz(X),
  fail.