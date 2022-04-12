room(kitchen).
room(office).
room(hall).
room('dinning room').
room(cellar).

location(desk, office).
location(flashlight, desk).
location(apple, kitchen).
location('washing machine', cellar).
location(nani, 'washing machine').
location(cheese, kitchen).
location(crackers, kitchen).
location(computer, office).

door(office, hall).
door(kitchen, office).
door(hall, 'dinning room').
door(kitchen, cellar).
door('dinning room', kitchen).

edible(apple).
edible(crackers).

poison(cheese).

turned_off(flashlight).

have(nothing).
here(kitchen).

where_food(Food) :-
  edible(Food),
  here(Place),
  location(Food, Place).

connect(Place1, Place2) :- door(Place1, Place2).
connect(Place1, Place2) :- door(Place2, Place1).

list_things(Place) :-
  location(Item, Place),
  tab(2),
  write(Item),
  nl,
  fail.
list_things(_).

list_connections(Place) :-
  connect(Place, NextPlace),
  tab(2),
  write(NextPlace),
  nl,
  fail.
list_connections(_).

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

can_go(Place) :-
  here(Here),
  connect(Here, Place).

move(Place) :-
  retract(here(_)),
  asserta(here(Place)).

take(Item) :-
  can_take(Item),
  take_object(Item).

can_take(Item) :-
  here(Place),
  location(Item, Place).
can_take(Item) :-
  write('There is no '),write(Item),write(' here.'),nl,
  fail.

take_object(Item) :-
  retract(location(Item, _)),
  asserta(have(Item)),
  write('You now have the '),write(Item),write('.'),nl.

put(Item) :-
  can_put(Item),
  put_object(Item).

can_put(Item) :-
  having(Item).

put_object(Item) :-
  having(Item),
  here(Place),
  retract(have(Item)),
  asserta(location(Item, Place)),
  write('You have put the '),write(Item),write(' in  '),write(Place),write('.'),nl.

having(Item) :-
  have(Item).

inventory :-
  write('You have:'),nl,
  having(Item),
  tab(2),
  write(Item),
  nl,
  fail.

turn_on(Item) :-
  can_turn_on(Item),
  turn_on_object(Item).

can_turn_on(Item) :-
  turned_off(Item).

turn_on_object(Item) :-
  retract(turned_off(Item)),
  write('You have turned on the '),write(Item),write('.'),nl.

turn_off(Item) :-
  can_turn_off(Item),
  turn_off_object(Item).

can_turn_off(Item) :-
  turned_off(Item).

turn_off_object(Item) :-
  asserta(turned_off(Item)),
  write('You have turned off the '),write(Item),write('.'),nl.

open_door(Place) :-
  can_open_door(Place),
  open_door_object(Place).

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
