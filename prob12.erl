-module(prob12).
-export([run/1, check_factors/3, triangle/1]).
%%
%% What is the value of the first triangle number to have over five hundred divisors?
%%
run(N) -> 
    NTriangle = triangle(N),
    Done = check_factors(NTriangle,1,0) > 500,
    if Done ->
	    io:format("The answer is ~w",[NTriangle]);
       true ->
	    run(N+1)
    end.
%%
%% turns out checking divisors is fast enough, of course we only need check up to the square root
%
check_factors(Num, Beg, Count) ->
    Done = Beg > math:sqrt(Num),
    if Done ->
	    2 * Count;
       true ->
	    Divides = (Num rem Beg) == 0,
	    if Divides ->
		    check_factors(Num,Beg+1,Count+1);
	       true ->
		    check_factors(Num,Beg+1,Count)
	    end
    end.
%%
%% compute the nth triangle number
triangle(1) ->
    1;
triangle(N) ->
    triangle(N-1) + N.
%%
%%
