set_difference([], _, []).

set_difference([H | T1], Set2, [H | T2]) :-
    \+ member(H, Set2),
    set_difference(T1, Set2, T2).

set_difference([H | T1], Set2, T2) :-
    member(H, Set2),
    set_difference(T1, Set2, T2).