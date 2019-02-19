#! /bin/bash

echo $@

# $GLPROJECT - numeric project id
# $GLTOKEN - gitlab user token

[[ -z $ALL_DOMAINS ]] && domain=$1 || domain=$ALL_DOMAINS
key=$2
# full cert chain
cert=$4

echo $domain
for d in $domain; do
    echo "Updating cert for domain: $d"
    curl --request PUT -H "PRIVATE-TOKEN: $GLTOKEN" \
        --form "certificate=@$cert" \
        --form "key=@$key" "https://gitlab.com/api/v4/projects/$GLPROJECT/pages/domains/$d"
done


