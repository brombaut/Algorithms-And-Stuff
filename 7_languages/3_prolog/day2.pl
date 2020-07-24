% find some implementations of fibonacci series and factorials. How do they work?
%  - http://cubbi.com/fibonacci/prolog.html

% what are some of the problems dealing with "not" expressions? Why do you have to be careful with negation in Prolog?
% Negation in prolog means "that a rule can not be proven true". That is not the same as being false.
% a negation in one rule might make other rules, on wich that rule "had influence" become suddenly false. This is not always obvious.
%
% in addition to that, the "argument" of a not clause, when it includes variables, makes the rule deceptively "stupid".

legal(a).
legal(b).
legal(c).
other(d).
illegal(X) :- \+ legal(X).

%  illegal(a) returns no, as expected
%  illegal(X) returns also no (it does not magically return d)


% reverse the elements of a list
invert([],[]).
invert([X],[X]).
invert(I, [Head|Tail]) :- invert(Rest,Tail), append(Rest, [Head], I).

% find the smallest element of a list

smallest([X], X).
smallest([Head|Tail], X) :- smallest(Tail, TailMin), X is min(Head,TailMin).


% 

insert_sort(List,Sorted) :- i_sort(List,[],Sorted).
i_sort([],Acc,Acc).
i_sort([H|T],Acc,Sorted) :- insert(H,Acc,NAcc),i_sort(T,NAcc,Sorted).
   
insert(X,[Y|T],[Y|NT]):-X>Y,insert(X,T,NT).
insert(X,[Y|T],[X,Y|T]):-X=<Y.
insert(X,[],[X]).