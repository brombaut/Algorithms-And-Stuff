-module(day2).
-export([dictionary_get/2, shopping_list/1]).

% consider a list of keyword-value tuples, such as [{erlang, "a functional lang"}, {ruby, "an OO lang"}]
% write a function that accepts the list and a keyword and returns the associated value for the keyword
dictionary_get(List, Name) ->
  [{_, Description}|_] = lists:filter(fun({Language,_}) -> Language == Name end, List),
  Description.

% consider a shopping list that looks like this: [{item quantity price}, ...]. Write a list comprehension
% that builds a list of items in the form [{item total_price}, ...] where total_price is quantity times price
shopping_list(List) ->
  [{Item, Quantity * Price} || {Item, Quantity, Price}  <- List].