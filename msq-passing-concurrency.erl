-module(echo).
-export([go/0,loop/0]).

go()->
    Pid = spawn(echo,loop,[]),
    Pid ! {self(),'hello'},

    receive
        {Sender,Msg}->
            io:format("~p~w~n",[Sender,Msg])
    end,
    Pid ! 'stop'
.


loop()->

    receive
        {Sender,Msg}-> 
            Sender ! {self(),Msg},
            io:format("~p~w~n",[Sender,Msg]),
            loop();
        'stop'-> true
    end
.
