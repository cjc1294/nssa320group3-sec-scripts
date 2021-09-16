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

# Get open ports/established connections

# Get firewalld restrictions

# Get information on installed packages