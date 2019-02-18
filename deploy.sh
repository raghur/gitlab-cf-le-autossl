#! /bin/bash

echo $@

# $GLPROJECT - numeric project id
# $GLTOKEN - gitlab user token

domain=$1
key=$2
# full cert chain
cert=$4

curl --request PUT -H "PRIVATE-TOKEN: $GLTOKEN" \
    --form "certificate=@$cert" \
    --form "key=@$key" "https://gitlab.com/api/v4/projects/$GLPROJECT/pages/domains/$domain"


