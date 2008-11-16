-module(prob1).
-export([run/0]).
%% If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
%% The sum of these multiples is 23.
%% Find the sum of all the multiples of 3 or 5 below 1000.
run() ->
    run(3, 10000, 0).
%%
%%
run(F,L,Sum) ->
    BoolDone = (F == L),
    Bool3 = (F rem 3 == 0),
    Bool5 = (F rem 5 == 0),
    if (BoolDone) ->
	    Sum;
       true ->
	    if (Bool3 or Bool5) ->
		    run(F + 1, L, Sum + F);
	       true -> run(F + 1,L,Sum)
	    end
    end.
%% add another comment
       
	    
	    
