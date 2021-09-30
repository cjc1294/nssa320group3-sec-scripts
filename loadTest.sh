#!/bin/bash
# Authors: Chris Cheney(cjc1294), Hannah Gosselin(hrg5188)
# Purpose:
#	Test the load of the server according to the settings
# Machines Affected:
#	Application server
# Usage:
#	Simply run the script. Siege will output running state and final statistics when completed

siegeLength="1M"
concurrentUsers="100"
targetIp="192.168.1.104"

siege -t $siegeLength -c $concurrentUsers $targetIp | grep -v "HTTP/1.1"