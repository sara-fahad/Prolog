parent(abraham,herb).
parent(abraham,homer).
parent(mona,herb).
parent(mona,homer).
parent(homer,bart).
parent(homer,lisa).
parent(homer,maggie).
parent(marge,bart).
parent(marge,lisa).
parent(marge,maggie).
parent(clancy,marge).
parent(clancy,patty).
parent(clancy,selma).
parent(jackie,marge).
parent(jackie,patty).
parent(jackie,selma).
parent(selma,ling).

male(abraham).
male(herb).
male(homer).
male(bart).
male(clancy).
female(mona).
female(marge).
female(lisa).
female(maggie).
female(jackie).
female(patty).
female(selma).
female(ling).

mother(M,X) :- parent(M,X), female(M).
father(F,X) :- parent(F,X), male(F).
son(X,Y) :- parent(Y,X), male(X).
daughter(X,Y) :- parent(Y,X), female(X).
sibling(X,Y) :- parent(P,X), parent(P,Y), X \= Y.
sister(X,Y) :- sibling(X,Y), female(X).
brother(X,Y) :- sibling(X,Y), male(X).
grandfather(G,X) :- parent(P,X), parent(G,P), male(G).
aunt(A,X) :- parent(P,X), sister(A,P).
uncle(U,X) :- parent(P,X), brother(U,P).
cousin(X,Y) :- parent(P1,X), parent(P2,Y), sibling(P1,P2).
ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).
