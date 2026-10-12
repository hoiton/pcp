:- use_module(library(http/http_client)).
:- use_module(library(http/http_json)).



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

sibling(X, Y) :- parent(Z, X), parent(Z, Y).

grandmother(X, Y) :- mother(X, Z), parent(Z, Y).
grandfather(X, Y) :- father(X, Z), parent(Z, Y).

offspring(X, Y) :- parent(Y, X).
offspring(X, Y) :- parent(Y, Z), offspring(X, Z).

solve_relationship(mother, X, Y) :- mother(X, Y).
solve_relationship(father, X, Y) :- father(X, Y).
solve_relationship(sibling, X, Y) :- sibling(X, Y).
% ... 


% -------------------------------------------
% Sudoku

:- use_module(library(clpfd)).
sudoku(Rows) :-
    append(Rows, Vs), Vs ins 1..9,
    maplist(all_distinct, Rows),
    transpose(Rows, Columns),
    maplist(all_distinct, Columns),
    Rows = [A, B, C, D, E, F, G, H, I],
    blocks(A, B, C), blocks(D, E, F), blocks(G, H, I),
    maplist(label, Rows).

blocks([], [], []).
blocks([J, K, L|Bs1], [M, N, O|Bs2], [P, Q, R|Bs3]) :-
    all_distinct([J, K, L, M, N, O, P, Q, R]),
    blocks(Bs1, Bs2, Bs3).

replace_zeros([], []).
replace_zeros([0|T1], [_|T2]) :- replace_zeros(T1, T2).
replace_zeros([H|T1], [H|T2]) :- 
    H \= 0,
    replace_zeros(T1, T2).

% -------------------------------------------
% Solve

solve(Type, ID) :-
    format(atom(URL),
           'http://localhost:16316/problem/~w/~w',
           [Type, ID]),
    http_get(URL, Reply, []),
    Reply = json(Data),

    solve_problem(Type, Data, Solution),

    format(atom(PostURL),
           'http://localhost:16316/problem/~w',
           [Type]),

    http_post(PostURL,
              json(json([id=ID, solution=Solution])),
              Response,
              []),
    writeln(Response).

solve_problem(relationship, Data, Solution) :-
    member(firstPerson=First, Data),
    member(relationship=Relationship, Data),
    member(secondPerson=Second, Data),

    writeln(First),
    writeln(Relationship),
    writeln(Second),

    Goal =.. [Relationship, First, Second],
    (   call(Goal)
    ->  Solution = "true"
    ;   Solution = "false"
    ).

solve_problem(sudoku, Data, Sudoku) :-
    member(sudoku=Rows, Data),
 
    writeln(Rows),

    maplist(replace_zeros, Rows, Sudoku),

    sudoku(Sudoku),

    maplist(writeln, Sudoku).
