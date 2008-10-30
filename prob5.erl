-module(prob5).
-export([run/0]).
%%
%%
run() ->
    Sum = (100 * 101) div 2,
    SqSum = Sum * Sum,
    SumSq = lists:foldl(fun(X,Tot) ->
				Tot + (X * X) end, 0, lists:seq(1,100)),
    SqSum - SumSq.
