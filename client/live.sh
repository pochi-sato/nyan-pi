#!/bin/sh

while [[ true ]]; do
  TEXT=$(curl -sS https://nyan.jsoizo.com/lives/latest \
    | jq -r '[.id, .scene, .status] | @csv' \
    | sed 's/\"//g')

  ID=$(echo $TEXT | cut -d ',' -f 1)
  SCENE=$(echo $TEXT | cut -d ',' -f 2)
  STATUS=$(echo $TEXT | cut -d ',' -f 3)
  #echo "id: ${ID} scene: ${SCENE} status: ${STATUS}"

  LAST_ID=$(cat live_status | cut -d ',' -f 1)
  LAST_STATUS=$(cat live_status | cut -d ',' -f 2)
  #echo "last_id: $LAST_ID last_status: ${LAST_STATUS}"

  if [[ $ID > $LAST_ID ]]; then
    echo "New Live is started!!!"
    open -a /Applications/Google\ Chrome.app https://appear.in/nyan_bunch?scene=$SCENE &
    echo "$ID,$STATUS" > live_status
  fi
  perl -MTime::HiRes -e 'Time::HiRes::sleep(0.1)';
done
