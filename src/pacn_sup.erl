-module(pacn_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    io:format(standard_error, "Starting pacn_sniffer server...\n", []),
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
    io:format(standard_error, "Initializing pacn_sniffer server...\n", []),
    Mod = pacn_sniffer,
    ChildSpec = {Mod, {Mod, start_link, []}, permanent, 5000, worker, [Mod]},
    {ok, { {one_for_one, 5, 10}, [ChildSpec]} }.

