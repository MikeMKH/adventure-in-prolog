remove(_, [], []).
remove(H, [H|T], T).
remove(X, [H|T], [H|T2]) :- remove(X, T, T2).

remove_all(_, [], []).
remove_all(H, [H|T], T2) :- remove_all(H, T, T2).
remove_all(X, [H|T], [H|T2]) :- remove_all(X, T, T2).

count([] , 0).
count([_|T], N) :- count(T, N1), N is N1 + 1.

take(_, [], []).
take(0, _, []).
take(N, [H|T], [H|T2]) :- N1 is N - 1, take(N1, T, T2).

drop(_, [], []).
drop(0, T, T).
drop(N, [_|T], T2) :- N1 is N - 1, drop(N1, T, T2).