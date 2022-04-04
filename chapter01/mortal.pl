% needs to be in this order
mortal(X) :- animal(X).
animal(X) :- person(X).
animal(X) :- dog(X).
person(X) :- non_philosopher(X).
person(X) :- philosopher(X).

philosopher(socrates).
philosopher(plato).
philosopher(aristotle).
philosopher(heraclitus).
philosopher(parmenides).

% cannot be a person, needs a level below since we have philosopher off of person
non_philosopher(mike).
non_philosopher(kelsey).

dog(lily).

mortal_report :-
  write('Known mortals: '),nl,
  mortal(X),
  write(X),nl,
  fail.