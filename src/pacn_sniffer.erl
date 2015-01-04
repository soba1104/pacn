-module(pacn_sniffer).

-behaviour(gen_server).

%% API
-export([start_link/0]).

%% gen_server callbacks
-export([
         init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3
        ]).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    io:format(standard_error, "pacn_sniffer:start_link\n", []),
    ServerName = {local, pacn_sniffer},
    gen_server:start_link(ServerName, ?MODULE, [], []).

%% ===================================================================
%% gen_server callbacks
%% ===================================================================

init(Args) ->
    io:format(standard_error, "pacn_sniffer:init(~p)\n", [Args]),
    epcap:start([]),
    {ok, {}}.

handle_call(Request, From, State) ->
    io:format(standard_error, "pacn_sniffer:handle_call(~p, ~p, ~p)\n", [Request, From, State]),
    {noreply, State}.

handle_cast(Request, State) ->
    io:format(standard_error, "pacn_sniffer:handle_cast(~p, ~p)\n", [Request, State]),
    {noreply, State}.

handle_info(Info, State) ->
    io:format(standard_error, "pacn_sniffer:handle_info(~p, ~p)\n", [Info, State]),
    {noreply, State}.

terminate(Reason, State) ->
    io:format(standard_error, "pacn_sniffer:terminate(~p, ~p)\n", [Reason, State]),
    ok.

code_change(_OlsVsn, State, _Extra) ->
    {ok, State}.
