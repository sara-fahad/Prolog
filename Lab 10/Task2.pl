user(sara, 1234).
user(faisal, 1111).
user(atheer, 5678).
user(lina, 9999).
user(faris, 4345).
user(dania, 4560).

login :-
    attempt(3).

attempt(0) :-
    write('Sorry, you exceeded the maximum number of attempts, try again later.').

attempt(N) :-
    N > 0,
    write('Enter username: '),
    read(Username),
    write('Enter password: '),
    read(Password),
    (user(Username, Password) ->
        write('Login Successful')
    ;
        write('Login Unsuccessful'), nl,
        Next is N - 1,
        attempt(Next)
    ).
