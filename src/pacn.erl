-module(pacn).

%% API
-export([start/3]).

%% ===================================================================
%% API functions
%% ===================================================================

start(Interface, Filter, Matcher) ->
    pacn_sup:start_sniffer(Interface, Filter, Matcher).
