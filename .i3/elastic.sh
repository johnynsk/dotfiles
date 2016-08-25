#!/bin/bash
URL="http://`ssh ev.d ngs.job_new config.get:Ngs_Database_ElasticSearch.hosts.0`/_plugin/head";
google-chrome ${URL}
