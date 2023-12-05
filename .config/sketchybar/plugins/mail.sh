#!/bin/sh

# 2023-12-04
# inspired by a himalaya user whose version looked like this:
#  C=$(himalaya -a catchall --output json search UNSEEN | jq -r '.|length')
#    M=$(himalaya --output json search UNSEEN | jq -r '.|length')
#    echo "mail [$M|$C]"
#
# and the docs example:
# himalaya --output json search NEW | jq -r '.|length' >> /tmp/himalaya-counter

WORKMAIL=$(himalaya --output json search RECENT | jq -r '.|length')

#v1
#sketchybar --set $NAME label="${WORKMAIL}"

#v2
if [ "$WORKMAIL" -gt 0 ]; then
    sketchybar --set $NAME label="📥"
else
    sketchybar --set $NAME label="😎"
fi
