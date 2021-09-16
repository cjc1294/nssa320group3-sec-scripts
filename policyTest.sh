#!/bin/bash

# Authors: Chris Cheney(cjc1294)
# Purpose:
#	Test the application servers to make sure they conform to the security policies
# Machines Affected:
#	Application server

# Firewall services and ports
expectedServices="dhcpv6 http ssh"
expectedPorts=""

# Get network information
echo "### NETWORK INFORMATION ###"
ip a

echo

echo "### CONNECTIVITY TEST ###"
ping google.com -c 2

echo

# Get open ports/established connections
echo "### ESTABLISHED CONNECTIONS ###"
ss -a -t -u -p | grep "ESTAB" | sed -r "s/\s+/    /g" # Get established connections, and use some sed replacement to clean up the whitespace

echo

echo "### LISTENING PORTS ###"
ss -l -t -u -p

echo

# Get firewalld restrictions
echo "### FIREWALL RULES ###"
services=$(firewall-cmd --list-all | grep "services" | -d ' ' -f4-)
echo "Firewalld services: $services"
if [[ $services != $expectedServices ]] then
	echo "!!Services do not match expected services: $expectedServices!!"
fi

ports=$(firewall-cmd --list-all | grep " ports" | -d ' ' -f4-)
echo "Firewalld ports: $ports"
if [[ $ports != $expectedPorts ]] then
	echo "!!Ports do not match expected ports: $expectedPorts!!"
fi