#! /bin/bash

# format of certs.txt - <gitlab project id> <domain> <alternative names>...
# ex:
# 10853369 mathease.rraghur.in
# 3341547 rraghur.in www.rraghur.in blog.rraghur.in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pushd $DIR
secrets=${1:-secrets}
certs=${2:-certs.txt}
echo $(readlink -f $secrets) $(readlink -f $certs)
[[ -r $secrets ]] && source $secrets
./dehydrated --register --accept-terms
awk '/^[0-9]+/ { 
    project=$1; domain=$2; 
    for (i=3; i <=NF; i++) {domain=domain" "$i}
    system( "ALL_DOMAINS=\"" domain "\" GLPROJECT=" project " ./dehydrated -d \"" domain "\" -c")
}' $certs
popd


