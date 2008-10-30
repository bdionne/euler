-module(prob9).
-export([run/0]).
%%
%%
run() ->
    P = lists:seq(1,998),
    [{A,B,C} || A <- P, B <- P, C <- P,  (A*A + B*B) == (C*C), (A + B + C) == 1000].
