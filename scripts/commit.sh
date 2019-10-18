#!/bin/bash -e

CURRENT_TIME=`date +"%H:%M"`
git add . -A
git commit -m "feat: live coding at ${CURRENT_TIME}"
