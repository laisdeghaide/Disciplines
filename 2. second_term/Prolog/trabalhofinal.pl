:- dynamic nome/1.
:- dynamic genero/1.
:- dynamic ator/1.
:- dynamic diretor/1.
:- dynamic sf/1.
:- dynamic tags/1.
:- dynamic estudio/1.
:- ensure_loaded([menu_trab]).
filme('De olhos bem fechados', drama, [1, 2], 1, filme, [americano, adulto], warner_bros).
filme('Black Mirror', scify,[1,2], 1, serie, [americano, adulto], netflix).

menu(1,X):-
    add_restricao(X),
    main.
menu(2,X):-
    remove_restricao(X),
    main.

menu(3,X):-
    mostra_restricao(X),
    main.

menu(4,X):-
    busca(X),
    main.



restricao(X):-
    nome(X).

restricao(X):-
    genero(X).

restricao(X):-
    ator(X).

restricao(X):-
    diretor(X).

restricao(X):-
    sf(X).

restricao(X):-
    tags(X).

restricao(X):-
    estudio(X).

add_restricao(X):-
    assert(X).

remove_restricao(X):-
    retract(X).

mostra_restricao(L):-
    findall(X, restricao(X), L).

busca(X):-
    mostra_restricao([]),
    filme(X,_,_,_,_,_,_).

busca(X):-
    nome(X),
    filme(X,_,_,_,_,_,_).

busca(X):-
    genero(Y),
    filme(X,Y,_,_,_,_,_).

busca(X):-
    ator(Y),
    filme(X,_,L,_,_,_,_),
    member(Y,L).

busca(X):-
    diretor(Y),
    filme(X,_,_,Y,_,_,_).

busca(X):-
    sf(Y),
    filme(X,_,_,_,Y,_,_).

busca(X):-
    tags(Y),
    filme(X,_,_,_,_,L,_),
    member(Y,L).

busca(X):-
    estudio(Y),
    filme(X,_,_,_,_,_,Y).
