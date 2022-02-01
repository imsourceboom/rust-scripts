#!/bin/bash

DB=$(df -h / | awk 'FNR == 2 {print $4}' | tr -d 'G')

echo $DB
