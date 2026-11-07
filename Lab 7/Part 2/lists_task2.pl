deleteElement(_, [], []).

deleteElement(X, [X|Tail], Result) :-
    deleteElement(X, Tail, Result).

deleteElement(X, [Y|Tail], [Y|Result]) :-
    X \= Y,
    deleteElement(X, Tail, Result).

add_at_the_end(X, [], [X]).

add_at_the_end(X, [Head|Tail], [Head|Result]) :-
    add_at_the_end(X, Tail, Result).
