% This program calculates the nth fibonacci number
% using alrogirhtm 1A: naive binary recursion
%
% compiled: swipl -q -O -t main -o f1a -c f1a.pl
% executed: ./f1a n

% Predicate f(N,F) is true if N'th Fibonacci number is F.
% It follows naive recursion recursion: F(n) = F(n-1) + F(n-2)
fib(0,0).
fib(1,1).
fib(N,F) :-
   succ(N1,N), succ(N2,N1), fib(N1,F1), fib(N2,F2), plus(F1,F2,F).

% Predicate fib_print(N) prints the n'th Fibonacci number.
fib_print(N) :-
   write(N), write('th Fibonacci number is '), fib(N,X), write(X), nl.