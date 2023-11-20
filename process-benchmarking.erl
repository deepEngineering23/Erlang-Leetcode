-module(ring).
-export([first/1,second/2]).

first(N)->
    second(self(),N).

second(Pid1,0)-> Pid1 ! ok;
second(Pid1 , N)->
    Pid = spawn(?MODULE,second,[Pid1,N-1]),
    Pid ! ok,
    receive
        ok->true
    end
.
