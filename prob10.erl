-module(prob10).
-export([main/1, loop/3]).

floor(X) ->
    T = erlang:trunc(X),
    case (X - T) of
        Neg when Neg < 0 -> T - 1;
        Pos when Pos > 0 -> T;
        _ -> T
    end.

checkUpTo(Beg,End,Num) ->
    if Beg =< End ->
	    if (Num rem Beg == 0 orelse Num rem (Beg + 2) == 0) ->
		    false;
	       true -> checkUpTo(Beg + 6,End,Num)
	    end;
       true -> true
    end.
    


isPrime(Num) ->
    if Num < 4 ->
	    true;
       true ->
	    if Num rem 2 == 0 ->
		    false;
	       true ->
		    if Num < 9 ->
			    true;
		       true ->
			    if Num rem 3 == 0 ->
				    false;
			       true ->
				    checkUpTo(5,floor(math:sqrt(Num)),Num)
			    end
		    end
	    end
    end.
	  
	  
	  
findPrimes(Limit, Printer, Begin) ->
    Done = Begin == Limit,
    if not Done ->
	    IsPrime = isPrime(Begin),
	    if IsPrime ->
		    Printer ! Begin;
	       true -> ok
	    end,
	    findPrimes(Limit, Printer, Begin + 1);
       true -> Printer ! stop 
    end.
    

main(Limit) ->
    Printer = spawn(sieve2, loop, [self(),0,0]),
    findPrimes(Limit, Printer, 2),
    receive
        done -> true
    end.

loop(Pid,Total,Sum) ->
    receive
        stop ->
            io:format("~n The sum of the primes is: ~w ~n",[Sum]);
        Num ->
	    %%io:format(" ~w ",[Num]),
	    loop(Pid,Total + 1,Sum+Num)
    end,
    Pid ! done.
