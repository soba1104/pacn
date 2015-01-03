#!/bin/sh

erl -noshell -pa ebin -eval 'application:start(pacn)'
