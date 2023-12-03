#!/usr/bin/env sh
#CURL='curl -s "wttr.in/?format=%c+%t+%m"'
#ECHO $CURL
#FETCH=$(ECHO $CURL)
#ECHO $FETCH
#sketchybar --set $NAME label="$(FETCH)"
FETCH=`curl -s "https://wttr.in/?m&format=%t+%m+%w"`
echo $FETCH

sketchybar --set $NAME label="    ${FETCH}"

