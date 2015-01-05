INTERFACE="lo0"
FILTER="port 12345"
MATCHER=pacn_example_matcher

default: compile

compile:
	rebar compile
	erlc -o ebin examples/*.erl

run:
	erl -pa ebin deps/*/ebin -eval '\
		application:ensure_all_started(pacn),\
		pacn:start($(INTERFACE), $(FILTER), $(MATCHER)).\
	'
