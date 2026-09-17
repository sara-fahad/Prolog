male(saad).
male(fahad).
male(abdullah).
male(faisal).
male(abdulaziz).
female(mashael).
female(sara).
female(cady).

parent(saad, fahad).
parent(saad, abdullah).
parent(fahad, sara).
parent(fahad, faisal).
parent(mashael, sara).
parent(mashael,faisal).
parent(abdullah, cady).
parent(abdullah, abdulaziz).

father(X,Y) :- male(X), parent(X,Y).
mother(X,Y) :- female(X), parent(X,Y).
sister(X,Y) :- female(X), parent(P,X), parent(P,Y), X \=Y.
brother(X,Y) :- male(X), parent(P,X), parent(P,Y), X \=Y.

