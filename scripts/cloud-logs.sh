#!/bin/bash

HALFHOUR_AGO="$(date -Iseconds -d '30 minutes ago'|sed -e s/-03:00/Z/)"
PROJECT="$1"
CLUSTER="$2"
POD=rest

#QUERY="resource.labels.cluster_name=\"${CLUSTER}\" resource.labels.container_name=\"${POD}\" timestamp>=\"${HALFHOUR_AGO}\"" 
# timestamp >= "2016-11-29T23:00:00Z"

# container
#QUERY="resource.labels.cluster_name=\"${CLUSTER}\" resource.labels.container_name=\"${POD}\" timestamp>=\"${HALFHOUR_AGO}\"" 
#QUERY="resource.type=http_load_balancer resource.labels.url_map_name=prod timestamp>=\"${HALFHOUR_AGO}\""
#QUERY="resource.type=http_load_balancer resource.labels.url_map_name=prod timestamp>=\"${HALFHOUR_AGO}\""
#QUERY="resource.type=http_load_balancer resource.labels.url_map_name=prod httpRequest.status>=500 timestamp=>\"${HALFHOUR_AGO}\""
#QUERY="resource.type=http_load_balancer resource.labels.url_map_name=prod httpRequest.status>=500 timestamp>=\"2022-09-21T19:45:29\" and timestamp<=\"2022-09-21T19:55:29\""
QUERY="resource.type=http_load_balancer resource.labels.url_map_name=prod timestamp>=\"${HALFHOUR_AGO}\""
echo $QUERY

echo gcloud --project=${PROJECT} logging read --order asc "$QUERY"
