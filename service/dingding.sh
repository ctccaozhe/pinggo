#!/bin/bash
to=$1
subject=$2
text=$3

curl -i -X POST \
'https://oapi.dingtalk.com/robot/send?access_token=2a7795251c10893355e1249896e739049ffb973b7a959c90cf92e6ee0ac06fd3' \
-H 'Content-type':'application/json' \
-d '
{
  "msgtype": "text",
     "text": {
        "content": "'不好啦服务器它又:''"$text"'"
        },
  "at":{
    "atMobiles":[
      "'"$1"'"
      ],
  "isAtAll":false
   } 
}'