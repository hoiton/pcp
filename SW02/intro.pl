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