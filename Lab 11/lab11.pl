:- dynamic letter/1.

letter(a).
letter(b).
letter(c).

start :-
    nl,
    write('Hi, This is the "Name Game".'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl,
    menu.

menu :-
    nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice....'), nl,
    read(Choice),
    do(Choice).

do(7) :- !,
    write('Your name is: '), show_name, nl,
    write('Goodbye!'), nl.
do(Choice) :-
    integer(Choice), Choice >= 1, Choice =< 6, !,
    option(Choice),
    menu.
do(_) :-
    write('Invalid choice, try again.'), nl,
    menu.

option(1) :-
    display_letters.

option(2) :-
    get_letter(L), !,
    assert(letter(L)),
    write('Letter added.'), nl,
    display_letters.
option(2) :-
    write('Invalid letter.'), nl.

option(3) :-
    get_letter(L), !,
    asserta(letter(L)),
    write('Letter added at the top.'), nl,
    display_letters.
option(3) :-
    write('Invalid letter.'), nl.

option(4) :-
    get_letter(L), !,
    assertz(letter(L)),
    write('Letter added at the bottom.'), nl,
    display_letters.
option(4) :-
    write('Invalid letter.'), nl.

option(5) :-
    get_letter(L), !,
    delete_letter(L),
    display_letters.
option(5) :-
    write('Invalid letter.'), nl.

option(6) :-
    retractall(letter(_)),
    write('All letters deleted.'), nl.

delete_letter(L) :-
    retract(letter(L)), !,
    write('Letter deleted.'), nl.
delete_letter(_) :-
    write('This letter is not in the set.'), nl.

get_letter(L) :-
    write('Enter a letter: '), nl,
    read(L),
    atom(L),
    atom_length(L, 1).

display_letters :-
    findall(L, letter(L), List),
    print_list(List).

print_list([]) :- !,
    write('The set is empty.'), nl.
print_list(List) :-
    write('Current letters: '),
    print_letters(List), nl.

print_letters([]).
print_letters([H|T]) :-
    write(H), tab(1),
    print_letters(T).

show_name :-
    letter(L),
    write(L),
    fail.
show_name.
