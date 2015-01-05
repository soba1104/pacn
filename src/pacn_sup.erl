-module(pacn_sup).

-behaviour(supervisor).

%% API
-export([start_link/0, start_sniffer/3]).

%% Supervisor callbacks
-export([init/1]).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

start_sniffer(Interface, Filter, Matcher) ->
    Mod = pacn_sniffer,
    Args = [Interface, Filter, Matcher],
    ChildSpec = {Mod, {Mod, start_link, Args}, permanent, 5000, worker, dynamic},
    supervisor:start_child(?MODULE, ChildSpec).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
    {ok, { {one_for_one, 5, 10}, []} }.

