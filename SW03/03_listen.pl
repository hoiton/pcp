
add_tail(X, [], [X]).
add_tail(X, [H1 | T1], [H1 | T2]) :- add_tail(X, T1, T2).
    

del([], _, []).
del([X | T], X, L1) :- del(T, X, L1).
del([N | T], X, [N | L1]) :- 
    N \= X,
    del(T, X, L1).

mem_d(X, L1) :-
    del(L1, X, L2),
    L1 \= L2.

rev_acc([], L, L).
rev_acc([H | T], A, R) :-
    A1 = [H | A],
    rev_acc(T, A1, R).

rev(L, R) :- rev_acc(L, [], R).