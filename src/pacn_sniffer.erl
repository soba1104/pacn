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
    ServerName = {local, pacn_sniffer},
    gen_server:start_link(ServerName, ?MODULE, [], []).

%% ===================================================================
%% gen_server callbacks
%% ===================================================================

init(_Args) ->
    {ok, {}}.

handle_call(_Request, _From, State) ->
    {noreply, State}.

handle_cast(_Request, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OlsVsn, State, _Extra) ->
    {ok, State}.
