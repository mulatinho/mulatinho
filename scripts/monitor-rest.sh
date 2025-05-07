#!/bin/bash
[ ! "$3" ] && echo "usage: $0 <context> <-lapp=NAME> <port>" && exit 1

context="$1"
appname="$2"
portnum="$3"

echo "context: $1"
echo "appname: $2, portnum: $3"

echo "--START--"
echo "Running on `date  +"%Y.%m.%0d-%H.%M.%S"` with HPA:"
kubectl get hpa --context $context $appname
echo
kubectl --context $context top pods -lapp=$appname | sort -k3 -r
echo
kubectl --context $context get pods -lapp=$appname | awk '{print $1}' | grep $appname | while read pod; do 
	echo -n "`date  +"%Y.%m.%0d-%H.%M.%S"`: pod '$pod' has this number of TCP and port:'$portnum' connections: "; 
	kubectl --context $context exec $pod -c $appname -- bash -c "egrep ' 01 ' /proc/1/net/tcp | wc -l | tr -d '\n'; echo -n ' '; awk '{print $3}' /proc/1/net/tcp | grep $portnum | wc -l"
done
echo "---END---"
echo;echo;
