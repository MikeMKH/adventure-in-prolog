resultsXYZ(Expression, X, Y, Z) :-
  resultsXY(Expression, X, Y),nl,
  write('Z = '),write(Z).

resultsXY(Expression, X, Y) :-
  resultsX(Expression, X),nl,
  write('Y = '),write(Y).

resultsX(Expression, X) :-
  write(Expression),nl,
  write('X = '),write(X).

t1 :-
  X = Y,
  resultsXY('X = Y', X, Y).

t2 :-
  X = Y, Y = hello,
  resultsXY('X = Y, Y = hello', X, Y).

t3 :-
  X = Y, a(Z) = a(Y), X = hello,
  resultsXYZ('X = Y, a(Z) = a(Y), X = hello', X, Y, Z).

ex1 :-
  a(b, c) = a(X, X),
  resultsX('a(b, c) = a(X, X)', X).

ex2 :-
  a(X, c(d, X)) = a(2, c(d, Y)),
  resultsXY('a(X, c(d, X)) = a(2, c(d, Y))', X, Y).

ex3 :-
  a(X, Y) = a(b(c, Y), Z),
  resultsXYZ('a(X, Y) = a(b(c, Y), Z)', X, Y, Z).

ex4 :-
  tree(left, root, Right) = tree(left, root, tree(a, b, tree(c, d, e))),
  resultsX('tree(left, root, Right) = tree(left, root, tree(a, b, tree(c, d, e)))', Right).