#!/bin/bash
cat log.txt | grep "error:" | cut -f 1 -d ':' | uniq -c | sort
