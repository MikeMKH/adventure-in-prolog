remove(_, [], []).
remove(H, [H|T], T).
remove(X, [H|T], [H|T2]) :- remove(X, T, T2).

removeAll(_, [], []).
removeAll(H, [H|T], T2) :- removeAll(H, T, T2).
removeAll(X, [H|T], [H|T2]) :- removeAll(X, T, T2).