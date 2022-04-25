sentence(S) :-
  operation(S-S1),
  arguments(S1-[]).

operation([add|X]-X) :-
  add(X, 0).

operation([mul|X]-X) :-
  mul(X, 1).

arguments([0|X]-X).
arguments([1|X]-X).
arguments([2|X]-X).
arguments([3|X]-X).
arguments([4|X]-X).
arguments([5|X]-X).
arguments([6|X]-X).
arguments([7|X]-X).
arguments([8|X]-X).
arguments([9|X]-X).

add([], 0).
add([X|Xs], Sum) :-
  add(Xs, Rest),
  Sum is X + Rest.

mul([], 1).
mul([X|Xs], Product) :-
  mul(Xs, Rest),
  Product is X * Rest.