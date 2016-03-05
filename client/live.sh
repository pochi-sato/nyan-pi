#!/bin/sh

while [[ true ]]; do
  TEXT=$(curl -sS https://nyan.jsoizo.com/lives/latest \
    | jq -r '[.id, .scene, .status] | @csv' \
    | sed 's/\"//g')

  ID=$(echo $TEXT | cut -d ',' -f 1)
  SCENE=$(echo $TEXT | cut -d ',' -f 2)
  STATUS=$(echo $TEXT | cut -d ',' -f 3)

  LAST_ID=$(cat live_status | cut -d ',' -f 1)
  LAST_STATUS=$(cat live_status | cut -d ',' -f 2)

  if [[ $ID > $LAST_ID ]]; then
    open -a /Applications/Google\ Chrome.app https://appear.in/nyan_bunch?scene=$SCENE &
    echo "$ID,$STATUS" > live_status
  fi
  sleep 1;
done
