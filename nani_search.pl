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
