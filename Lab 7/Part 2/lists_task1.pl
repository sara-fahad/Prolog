deleteElement(_, [], []).

deleteElement(X, [X|Tail], Result) :-
    deleteElement(X, Tail, Result).

deleteElement(X, [Y|Tail], [Y|Result]) :-
    X \= Y,
    deleteElement(X, Tail, Result).
