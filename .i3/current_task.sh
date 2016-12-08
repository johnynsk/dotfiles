#!/bin/bash
QUERY=assignee%3DcurrentUser\(\)%20and%20status%20%3D%20%22In%20Progress%22
TASK=`source ~/.config/jira && curl -u $user:$password http://$host/rest/api/2/search?jql=$QUERY 2>/dev/null | sed -rn 's/.*"key":"([A-Z]+)-([0-9]+)".*/http\:\/\/$host\/browse\/\1-\2/p'`
#echo ${TASK}
google-chrome ${TASK}
