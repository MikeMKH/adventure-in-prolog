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