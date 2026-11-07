square(Side) :-
    Area is Side * Side,
    Perimeter is 4 * Side,
    write('Area = '), write(Area), nl,
    write('Perimeter = '), write(Perimeter).

rectangle(Length, Width) :-
    Area is Length * Width,
    Perimeter is 2 * (Length + Width),
    write('Area = '), write(Area), nl,
    write('Perimeter = '), write(Perimeter).

triangle(A, B, C, Height) :-
    Area is (B * Height) / 2,
    Perimeter is A + B + C,
    write('Area = '), write(Area), nl,
    write('Perimeter = '), write(Perimeter).
