:- dynamic loc/2.

% from http://www.amzi.com/manuals/amzi/pro/pug_tutorial.htm

% Experiments
nextto(house, yard).
nextto(yard, pen).

loc(you, house).

move(Place) :-
  retract( loc(you, _) ),
  assert( loc(you, Place) ).

goto(P) :-
  loc(you, X),
  nextto(X, P),
  move(P).
