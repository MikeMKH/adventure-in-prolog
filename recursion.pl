sum(To, To, Result, Result).
sum(From, To, Result, X) :-
  From < To,
  From1 is From + 1,
  FromPlusResult is From + Result,
  sum(From1, To, FromPlusResult, X).

factorial_1(1, 1).
factorial_1(N, F) :-
  N > 1,
  N1 is N - 1,
  factorial_1(N1, F1),
  F is N * F1.

factorial_2(1, F, F).
factorial_2(N, T, X) :-
  N > 1,
  N1 is N - 1,
  TN is T * N,
  factorial_2(N1, TN, X).

addition(0, 0, X, X).
addition(0, N, T, X) :-
  N > 0,
  addition(N, 0, T, X).
addition(A, B, T, X) :-
  A > 0,
  A1 is A - 1,
  T1 is T + 1,
  addition(A1, B, T1, X).