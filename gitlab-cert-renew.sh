#! /bin/bash

# 10853369 mathease.rraghur.in
# 3341547 rraghur.in www.rraghur.in blog.rraghur.in

awk '/^[0-9]+/ { 
    project=$1; domain=$2; 
    for (i=3; i <=NF; i++) {domain=domain" "$i}
    system( "ALL_DOMAINS=\"" domain "\" GLPROJECT=" project " ./dehydrated -d \"" domain "\" -c")
}' certs.txt


