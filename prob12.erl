-module(prob12).
-export([run/1, fact/1, triangle/1]).
%%
%% What is the value of the first triangle number to have over five hundred divisors?
%%
run(N) -> 
    NTriangle = triangle(N),
    Factors = all_facts(prob3:factor(NTriangle,2,[])),
    Bool = (length(Factors) + 2) > 5,
    if Bool ->
	    io:format("The first triangle number with over 500 factors is ~w",[NTriangle]);
       true ->
	    run(N+1)
    end.
%%
%%
all_facts(ListOfPrimes) ->
    Facts = sets:from_list(ListOfPrimes),
    all_facts(ListOfPrimes,Facts,2);
%%
all_facts(ListOfPrimes, DistinctFactors, N) ->
    lists:map(fun(E) ->
		      
%
    
    
%%
%%
fact(0) ->
    1;
fact(N) ->
    N * fact(N-1).
%%
%%
triangle(1) ->
    1;
triangle(N) ->
    triangle(N-1) + N.
%%
%%
