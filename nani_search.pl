room(kitchen).
room(office).
room(hall).
room('dinning room').
room(cellar).

location(object(desk, heavy), office).
location(object(flashlight, light), object(desk, heavy)).
location(object(envelope, light), object(desk, heavy)).
location(object(paperclip, light), object(desk, heavy)).
location(object(stamp, light), object(envelope, light)).
location(object(key, light), object(envelope, light)).
location(object(apple, light), kitchen).
location(object('washing machine', heavy), cellar).
location(object(nani, light), object('washing machine', heavy)).
location(object(cheese, light), kitchen).
location(object(crackers, light), kitchen).
location(object(computer, heavy), office).

door(office, hall).
door(kitchen, office).
door(hall, 'dinning room').
door(kitchen, cellar).
door('dinning room', kitchen).

edible(apple).
edible(crackers).

poison(cheese).

turned_off(flashlight).

have(object(nothing, none)).
here(kitchen).

where_food(Food) :-
  edible(Food),
  here(Place),
  location(Food, Place).
:- op(35, fx, where_food).

connect(Place1, Place2) :- door(Place1, Place2).
connect(Place1, Place2) :- door(Place2, Place1).

list_things(Place) :-
  location(object(Item, _), Place),
  tab(2),
  write(Item),
  nl,
  fail.
list_things(_).
:- op(35, fx, list_things).

list_connections(Place) :-
  connect(Place, NextPlace),
  tab(2),
  write(NextPlace),
  nl,
  fail.
list_connections(_).
:- op(35, fx, list_connections).

look :-
  here(Place),
  write('You are in the '), write(Place), nl,
  write('You can see:'), nl,
  list_things(Place),
  write('You can go to:'), nl,
  list_connections(Place).

goto(Place) :-
  can_go(Place),
  move(Place),
  look.
:- op(35, fx, goto).

can_go(Place) :-
  here(Here),
  connect(Here, Place).

move(Place) :-
  retract(here(_)),
  asserta(here(Place)).

take(Item) :-
  can_take(Item),
  take_object(Item).
:- op(35, fx, take).

can_take(Item) :-
  here(Place),
  is_contained_in(object(Item, light), Place).
can_take(object(Item, light)) :-
  write('There is no '),write(Item),write(' here.'),nl,
  fail.
can_take(object(Item, heavy)) :-
  write('The '),write(Item),write(' is too heavy.'),nl,
  fail.

take_object(Item) :-
  retract(location(object(Item, _), _)),
  asserta(have(Item)),
  write('You now have the '),write(Item),write('.'),nl.
:- op(35, fx, take_object).

put(Item) :-
  can_put(Item),
  put_object(Item).
:- op(35, fx, put).

can_put(Item) :-
  having(Item).

put_object(Item) :-
  having(Item),
  here(Place),
  retract(have(Item)),
  asserta(location(object(Item, light), Place)),
  write('You have put the '),write(Item),write(' in  '),write(Place),write('.'),nl.

having(Item) :-
  have(Item).

inventory :-
  write('You have:'),nl,
  having(object(Item, _)),
  tab(2),
  write(Item),
  nl,
  fail.

turn_on(Item) :-
  can_turn_on(Item),
  turn_on_object(Item).
:- op(35, fx, turn_on).

can_turn_on(Item) :-
  turned_off(Item).

turn_on_object(Item) :-
  retract(turned_off(Item)),
  write('You have turned on the '),write(Item),write('.'),nl.

turn_off(Item) :-
  can_turn_off(Item),
  turn_off_object(Item).
:- op(35, fx, turn_off).

can_turn_off(Item) :-
  turned_off(Item).

turn_off_object(Item) :-
  asserta(turned_off(Item)),
  write('You have turned off the '),write(Item),write('.'),nl.

open_door(Place) :-
  can_open_door(Place),
  open_door_object(Place).
:- op(35, fx, open_door).

can_open_door(Place) :-
  door(Place, _).

open_door_object(Place) :-
  retract(door(Place, _)),
  asserta(door(Place, _)),
  write('You have opened the door.'),nl.

close_door(Place) :-
  can_close_door(Place),
  close_door_object(Place).

can_close_door(Place) :-
  door(Place, _).

close_door_object(Place) :-
  retract(door(Place, _)),
  asserta(door(Place, _)),
  write('You have closed the door.'),nl.

is_contained_in(Place, Container) :-
  location(Place, Container).
is_contained_in(Place, Container) :-
  location(Place, X),
  is_contained_in(X, Container).
% is_contained_in(Place, Container) :-
%   location(X, Container),
%   is_contained_in(Place, X).

% is_contained_in(X, Container).
% [trace]  ?- is_contained_in(key, office).
%    Call: (10) is_contained_in(key, office) ? creep
%    Call: (11) location(key, office) ? creep
%    Fail: (11) location(key, office) ? creep
%    Redo: (10) is_contained_in(key, office) ? creep
%    Call: (11) location(key, _38232) ? creep
%    Exit: (11) location(key, envelope) ? creep
%    Call: (11) is_contained_in(envelope, office) ? creep
%    Call: (12) location(envelope, office) ? creep
%    Fail: (12) location(envelope, office) ? creep
%    Redo: (11) is_contained_in(envelope, office) ? creep
%    Call: (12) location(envelope, _42758) ? creep
%    Exit: (12) location(envelope, desk) ? creep
%    Call: (12) is_contained_in(desk, office) ? creep
%    Call: (13) location(desk, office) ? creep
%    Exit: (13) location(desk, office) ? creep
%    Exit: (12) is_contained_in(desk, office) ? creep
%    Exit: (11) is_contained_in(envelope, office) ? creep
%    Exit: (10) is_contained_in(key, office) ? creep
% true .

% is_contained_in(Place, X).
% [trace]  ?- is_contained_in(key, office).
%    Call: (10) is_contained_in(key, office) ? creep
%    Call: (11) location(key, office) ? creep
%    Fail: (11) location(key, office) ? creep
%    Redo: (10) is_contained_in(key, office) ? creep
%    Call: (11) location(_60498, office) ? creep
%    Exit: (11) location(desk, office) ? creep
%    Call: (11) is_contained_in(key, desk) ? creep
%    Call: (12) location(key, desk) ? creep
%    Fail: (12) location(key, desk) ? creep
%    Redo: (11) is_contained_in(key, desk) ? creep
%    Call: (12) location(_65024, desk) ? creep
%    Exit: (12) location(flashlight, desk) ? creep
%    Call: (12) is_contained_in(key, flashlight) ? creep
%    Call: (13) location(key, flashlight) ? creep
%    Fail: (13) location(key, flashlight) ? creep
%    Redo: (12) is_contained_in(key, flashlight) ? creep
%    Call: (13) location(_69550, flashlight) ? creep
%    Fail: (13) location(_69550, flashlight) ? creep
%    Fail: (12) is_contained_in(key, flashlight) ? creep
%    Redo: (12) location(_65024, desk) ? creep
%    Exit: (12) location(envelope, desk) ? creep
%    Call: (12) is_contained_in(key, envelope) ? creep
%    Call: (13) location(key, envelope) ? creep
%    Exit: (13) location(key, envelope) ? creep
%    Exit: (12) is_contained_in(key, envelope) ? creep
%    Exit: (11) is_contained_in(key, desk) ? creep
%    Exit: (10) is_contained_in(key, office) ? creep
% true .