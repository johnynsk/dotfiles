#!/bin/bash
URL="http://guest:guest@`ssh ev.d ngs.job_new config.get:Ngs_Queue_RabbitMQ.host`:15672/";
google-chrome ${URL}
