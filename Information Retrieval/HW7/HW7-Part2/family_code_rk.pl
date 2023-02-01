/* Facts */
parent(sam, ron). 
parent(hoz, ron).
parent(hoz, kim).
parent(ron, wan).
parent(ron, mat).
parent(mat, pol).

female(sam).
female(kim).
female(wan).
female(mat).
male(hoz).
male(ron).
male(pol).

/* Rules */
offspring(X, Y):-
    parent(X, Y).

mother(X, Y):-
    parent(X, Y),
    female(X).

grandparent(X, Z):-
    parent(X, Y),
    parent(Y, Z).

sister(X, Y):-
    parent(Z, X),
    parent(Z, Y),
    female(X),
    different(X, Y).

predecessor(X, Z):-
    parent(X, Z).

predecessor(X, Z):-
    parent(X, Y),
    predecessor(Y, Z).

brother(X,Y):-parent(Z,X),parent(Z,Y),male(X),X\==Y.

wife(X,Y):-parent(X,Z),parent(Y,Z),female(X),male(Y).

uncle(X,Z):-brother(X,Y),parent(Y,Z).

