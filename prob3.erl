-module(prob3).
-export([run/1, factor/3]).
%%
%% The prime factors of 13195 are 5, 7, 13 and 29.
%% What is the largest prime factor of the number 600851475143
%%
run(N) ->
    lists:max(factor(N,2,[])).
%%
%%
factor(N,P,Factors) ->
    Bool = (N rem P) == 0,
    if Bool ->
	    F = N div P,
	    Bool2 = (F == 1),
	    if Bool2 ->
		    [N];
	       true ->
		    lists:flatten(lists:map(fun(E) ->
			      factor(E,2,[]) end, [F,P]))
	    end;
       true -> factor(N,P+1,Factors)
    end.
    
    
    
    
