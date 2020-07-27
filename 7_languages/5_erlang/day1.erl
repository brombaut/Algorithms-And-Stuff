% find the erlang official website
%   http://www.erlang.org/

% official documentation for erlag's function library
%   http://www.erlang.org/doc/reference_manual/functions.html

% The documentation of Erlang's OTP library
%   http://www.erlang.org/doc/

-module(day1).
-export([count_words/1, count_to_ten/0, successful/1]).

% write a function that counts the number of words on a string, recursively
count_words(Str) -> count_items(string:tokens(Str, " ")).

count_items([]) -> 0;
count_items([_ | Tail]) -> 1 + count_items(Tail).


% write a function that uses recursion to count to ten
count_to_ten() -> count_from(1, 10).

count_from(X,X) -> X;
count_from(X,Y) ->
  io:format("~.10B~n", [X]),
  count_from(X+1, Y).


% write a function that uses matching to selectively print "success" or "error message" given input on the form {error, Message} or success
successful(success) -> io:format("success~n", []);
successful({error, Message}) -> io:format("~s~n", [Message]).