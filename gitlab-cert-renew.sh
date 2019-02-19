#! /bin/bash

# format of certs.txt - <gitlab project id> <domain> <alternative names>...
# ex:
# 10853369 mathease.rraghur.in
# 3341547 rraghur.in www.rraghur.in blog.rraghur.in

[[ -r secrets ]] && source secrets
awk '/^[0-9]+/ { 
    project=$1; domain=$2; 
    for (i=3; i <=NF; i++) {domain=domain" "$i}
    system( "ALL_DOMAINS=\"" domain "\" GLPROJECT=" project " ./dehydrated -d \"" domain "\" -c")
}' certs.txt


