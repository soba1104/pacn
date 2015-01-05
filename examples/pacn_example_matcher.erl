-module(pacn_example_matcher).

-export([init/0, match/2]).

init() ->
    {ok, {}}.

match(Packet, State) ->
    io:format("matching packet(~p)...\n", [Packet]),
    {ok, State}.
