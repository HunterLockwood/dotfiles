#!/bin/sh

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
  exit 0
fi

case ${PERCENTAGE} in
  [8-9][0-9]|100) ICON="􀞽"
  ;;
  [4-7][0-9]) ICON="􀋧"
  ;;
  [1-3][0-9]) ICON="􀽥"
  ;;
  *) ICON="􀽥"
esac

if [[ $CHARGING != "" ]]; then
  ICON="􁌲"
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set $NAME icon="$ICON" label="${PERCENTAGE}%"
