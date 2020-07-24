% An implementation of the Towers of Hanoi

hanoi(N) :- dohanoi(N, 3, 1, 2).

dohanoi(0, _ , _ , _ ) :- !.
dohanoi(N, A, B, C) :-
  N_1 is N-1,
  dohanoi(N_1, A, C, B),
  moveit(A, B),
  dohanoi(N_1, C, B, A).

moveit(F, T) :- write([move, F, -->, T]), nl.

% explanation: This implementation seems to be attempting all the possible combinations until it finds one that satisfies the constraints.
% The constraints are encoded in the way the first three parameters (3,1,2) are referenced on the dohanoi rule.