main:-
    open('menu.txt',read,S),
    readWord(S,W),
    close(S),
    write(W),nl.

checkCharAndReadRest(-1, [],_) :- !.
checkCharAndReadRest(Char,[Char|Chars],S):-
    get_code(S,NextChar),
    checkCharAndReadRest(NextChar,Chars,S).

readWord(Stream,Word):-
    get_code(Stream,Char),
    checkCharAndReadRest(Char,Chars,Stream),
    atom_codes(Word,Chars).

