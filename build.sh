#!/bin/bash
clear

if type -P node; then
	node ../../engine/script/js/build.js target=$1
else
	../../tools/build/Node/node ../../engine/script/js/build.js target=$1
fi