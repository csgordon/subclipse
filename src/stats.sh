#!/bin/bash
cat log.txt | grep "error:" | cut -f 1 -d ':' | sort | uniq -c
