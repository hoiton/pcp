% Aufgabe 1

female(mary). female(liz). female(mia). female(tina). female(ann). female(sue).	% all females
male(mike). male(jack). male(fred). male(tom). male(joe). male(jim).			% all males
parent(mary, mia). parent(mary, fred). parent(mary, tina).						% all childern of mary
parent(mike, mia). parent(mike, fred). parent(mike, tina).						% all children of mike
parent(liz, tom). parent(liz, joe).												% allchildern of liz
parent(jack, tom). parent(jack, joe).											% all childern of jack
parent(mia, ann).																% all childern of mia
parent(tina, sue). parent(tina, jim).											% all childern of tina
parent(tom, sue). parent(tom, jim).												% all childern of tom

mother(X, Y) :- parent(X, Y), female(X).
father(X, Y) :- parent(X, Y), male(X).

% mother(X, jim)
% father(X, jim)

% parent(mary, X)

sibling(X, Y) :- parent(Z, X), parent(Z, Y).

grandmother(X, Y) :- mother(X, Z), parent(Z, Y).
% grandmother(X, jim).

offspring(X, Y) :- parent(Y, X).
offspring(X, Y) :- parent(Y, Z), offspring(X, Z). 



% ---------------------------------------------------
% Aufgabe 2

% grandmother(liz, X)
% |
% v
% mother(liz, Z), parent(Z, X)
% |
% v
% parent(liz, Z), female(liz), parent(Z, X)
% |------------------------------------------
% |											|
% Z = tom									Z = joe
% |											|
% v											v
% female(liz), parent(tom, X)				female(liz), parent(joe, X)
% |											|
% v											v
% parent(tom, X)							parent(joe, X)
% |------------------						|
% |					|						v
% X = sue			X = jim					false
% |					|
% v					v
% parent(tom, sue)	parent(tom, jim)
% |					|
% v					v
% true				true


% offspring(ann, mary)

% |
% |-------------------------------------------------------
% |                                                      |
% v                                                      v
% parent(mary, ann)                         parent(mary, Z), offspring(ann, Z)
% |                                                      |
% v                                                      |
% false                                                  |
%                                                        |
%                         |------------------------------|------------------------------|
%                         |                              |                              |
%                      Z = mia                        Z = fred                       Z = tina
%                         |                              |                              |
%                         v                              v                              v
%                 offspring(ann, mia)            offspring(ann, fred)            offspring(ann, tina)
%                         |                              |                              |
%               |---------|---------|                    |                    |---------|---------|
%               |                   |                    |                    |                   |
%               v                   v                    v                    v                   v
%       parent(mia, ann)   parent(mia, Z1),      parent(fred, ann)    parent(tina, ann)   parent(tina, Z1),
%                         offspring(ann, Z1)                                             offspring(ann, Z1)
%               |                   |                    |                    |                   |
%               v                   v                    v                    v            |------|------|
%              true              Z1 = ann              false                false         |             |
%                                   |                                                    Z1 = sue      Z1 = jim
%                                   v                                                       |             |
%                           offspring(ann, ann)                                              v             v
%                                   |                                               offspring(ann,sue) offspring(ann,jim)
%                         |---------|---------|                                            |             |
%                         |                   |                                            v             v
%                         v                   v                                          false         false
%                 parent(ann, ann)    parent(ann, Z2),
%                                    offspring(ann, Z2)
%                         |                   |
%                         v                   v
%                       false               false



% ---------------------------------------------------
% Aufgabe 3

word(n, e, u).
word(t, o, p).
word(t, o, t).
word(b, r, o, t).
word(g, r, a, u).
word(h, a, l, t).
word(a, l, l, e).
word(j, e, t, z, t).
word(s, a, g, e, n).
word(u, n, t, e, n).
word(z, e, c, k, e).

crossword(L1, L2, L3, L4, L5, L6, L7, L8, L9, L10, L11, L12) :-
    word(L2, L3, L4, L5),
    word(L8, L9, L10, L11, L12),
    word(L1, L3, L6, L8),
    word(L5, L7, L10).


% ---------------------------------------------------
% Aufgabe 4

n(red, green).
n(green, red).
n(red, yellow).
n(yellow, red).
n(green, yellow).
n(yellow, green).

colors(UR, LU, NW, OW, SZ, ZG) :-
    UR = yellow,
    SZ = red,
    n(UR, NW),
    n(UR, OW),
    n(UR, SZ),
    n(SZ, ZG),
    n(SZ, LU),
    n(SZ, NW),
    n(NW, OW),
    n(NW, LU),
    n(OW, LU),
    n(LU, ZG).


% ---------------------------------------------------
% Aufgabe 5

:- op(1150, xfx, mother).
:- op(1150, xfx, offspring).


% ---------------------------------------------------
% Aufgabe 6

% X is 16 / 4 / 2
% is operator führt dazu, dass die Rechnung evaluiert wird.
% dann wird erst 16/4 gerechnet da / ein yfx operator ist 
% -> präzedenz von x MUSS kleiner sein als von f -> wird von Links nach rechts evaluiert

% Y = 3, X = Y - 1.
% Antwort ist: Y = 3, X = 3 - 1.
% => X wird nie evaluiert

% Y = 3, X is Y - 1
% Antwort ist: Y = 3, X = 2.
% is führt dazu dass die rechnung evaluiert wird



% ---------------------------------------------------
% Aufgabe 7

mult(0, _, 0).

mult(X, Y, Z) :-
    X > 0,
    X1 is X - 1,
    mult(X1, Y, Z1),
    Z is Z1 + Y.

% Ohne X > 0, gibt es keine Abbruchbedingung und es wird immer weiter nach lösungen mit negativen X gesucht