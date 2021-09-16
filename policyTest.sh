#!/bin/bash

# Authors: Chris Cheney(cjc1294)
# Purpose:
#	Test the application servers to make sure they conform to the security policies
# Machines Affected:
#	Application server

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

# Get firewalld restrictions

# Get information on installed packages