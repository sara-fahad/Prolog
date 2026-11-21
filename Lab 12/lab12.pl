edge('Makkah', 'Madinah').
edge('Makkah', 'Riyadh').
edge('Madinah', 'Makkah').
edge('Madinah', 'Taif').
edge('Madinah', 'Tabuk').
edge('Taif', 'Dammam').
edge('Taif', 'Tabuk').
edge('Tabuk', 'Taif').
edge('Jubail', 'Madinah').
edge('Jubail', 'Dammam').
edge('Dammam', 'Jubail').
edge('Dammam', 'Riyadh').
edge('Riyadh', 'Dammam').

travel(Start, End, Path) :-
    route(Start, End, [Start], RevPath),
    reverse(RevPath, Path).

route(Current, End, Visited, Path) :-
    edge(Current, Next),
    \+ member(Next, Visited),
    continue(Next, End, [Next|Visited], Path).

continue(End, End, Visited, Visited).
continue(Next, End, Visited, Path) :-
    Next \== End,
    route(Next, End, Visited, Path).
