#!/bin/sh

erl -pa ebin deps/*/ebin -eval "application:ensure_all_started(pacn), pacn:start(\"$1\", \"$2\")"
