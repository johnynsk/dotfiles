#!/bin/bash
TASK=`source ~/.config/jira && curl -u $user:$password http://jira.rn/rest/api/2/search?jql=labels=jwh:$user:in-work 2>/dev/null | sed -rn 's/.*"key":"([A-Z]+)-([0-9]+)".*/http\:\/\/jira.rn\/browse\/\1-\2/p'`
google-chrome ${TASK}
