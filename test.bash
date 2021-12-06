#!/bin/bash

function show_build_info {
  export VERSION_CODE_OFFSET=0
  echo -e 'Platform:  \033[1miOS\033[0m'
  appcenter build branches list --output json --app=Airfox/banQi-iOS > output.json
  node index.js

  export VERSION_CODE_OFFSET=500
  echo -e 'Platform:  \033[1mAndroid\033[0m'
  appcenter build branches list --output json --app=Airfox/banQi-Android-1 > output.json
  node index.js
}

appcenter apps list >/dev/null
if [ $? -eq 0 ] 
then 
  show_build_info
else 
  appcenter login
  show_build_info
fi