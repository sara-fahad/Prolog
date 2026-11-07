
basket([pistachios, chocolate, yogurt, honey, cherries]).

start :-
    basket(Items),
    menu(Items).

menu(Items) :-
    nl,
    write('** SHOPPING LIST **'), nl,
    write('d. display all items.'), nl,
    write('a. Add an item to the list.'), nl,
    write('e. exit.'), nl,
    write('ENTER YOUR CHOICE .'), nl,
    read(Choice),
    action(Choice, Items).

action(d, Items) :-
    display_items(Items),
    menu(Items).

action(a, Items) :-
    write('Entre the item you want to add'), nl,
    read(NewItem),
    append(Items, [NewItem], UpdatedItems),
    write('The item has been added'), nl,
    menu(UpdatedItems).

action(e, _) :-
    write('Goodbye!'), nl.

display_items([]).
display_items([Head|Tail]) :-
    write(Head), nl,
    display_items(Tail).
