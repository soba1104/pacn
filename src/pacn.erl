-module(pacn).

%% API
-export([start/2]).

%% ===================================================================
%% API functions
%% ===================================================================

start(Interface, Filter) ->
    pacn_sup:start_sniffer(Interface, Filter).
