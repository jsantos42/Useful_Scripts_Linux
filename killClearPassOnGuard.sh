#!/bin/bash

PIDS=$(ps aux | grep clearpass-onguard | grep ctw | grep -v grep | tr -s ' ' | cut -d ' ' -f 2)

for x in $PIDS
do
	kill -9 $x
done


