-module(prob14).
-export([run/0]).
%%
%% Find the longest collatz sequence for a number less than one million
%%
run() ->
    Nums = lists:seq(1,1000000),
    lists:foldl(fun(Elem, [Idx, Max]) ->
			Len = collatz(Elem),
			if Len > Max ->
				[Elem, Len];
			   true -> [Idx, Max]
			end end,[1,1],Nums).
%%
%%
collatz(Num) ->
    collatz(Num,1).
%%
%%
collatz(Num, Len) ->
    case Num of
	1 -> Len;
	Num when (Num rem 2 == 0) ->
	    collatz(Num div 2, Len + 1);
	_Else -> collatz(3 * Num + 1, Len + 1)
    end.
				
