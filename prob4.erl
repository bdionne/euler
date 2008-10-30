-module(prob4).
-export([run/0, list_digits/2, check_digits/1, is_pal/1, find_next/2]).
%%
%% A palindromic number reads the same both ways. 
%% The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
%% Find the largest palindrome made from the product of two 3-digit numbers.
%%
run() ->
    max_pal(999,999,999).
%%
%%
max_pal(M,N,Max) ->
    %%io:format("checking values: ~w, ~w, and ~w ~n",[M,N,M*N]),
    Done = M < 100,
    if Done ->
	    0;
       true ->
	    Sol = M*N,   
	    Bool = is_pal(Sol),
	    if Bool ->
		    Sol;
	       true ->
		    Diag = (M == N),
		    if Diag ->
			    Room = M < Max,
			    if Room ->
				    max_pal(M+1,N-1,Max);
			       true ->
				    max_pal(M,N-1,Max)
			    end;
		       true ->
			    Room = M < Max,
			    if Room ->
				    max_pal(M+1,N-1,Max);
			       true ->
				    [NM, NN] = find_next(M,N),
				    max_pal(NM,NN,Max)
			    end					    
		   end
	    end
    end.
%%
find_next(M,N) ->
   %% io:format("~w foo ~w ~n",[M,N]),
    Done = (M == N),
    if Done ->
	    [M,N-1];
       true ->
	    Up = (M-1 == N),
    if Up ->
	    [M-1, N];
       true ->
	    Over = (N+1 == M),
	    if Over ->
		    [M,N];
	       true ->
		    find_next(M-1,N+1)
	    end
    end
    end.
%%
is_pal(N) ->
    check_digits(list_digits(N,[])).
%%
check_digits(List) ->
    Done = (length(List) < 1),
    if Done ->
	    true;
       true ->
	    (hd(List) == lists:last(List)) andalso check_digits(lists:reverse(tl(lists:reverse(tl(List)))))
    end.
%%
%%
list_digits(N,Digits) ->
    Div = N div 10,
    Rem = N rem 10,
    Bool = Div == 0,
    if Bool ->
	    lists:append([Rem],Digits);
       true -> lists:append(list_digits(Div,[]),[Rem])
    end.
    
    
    
    
