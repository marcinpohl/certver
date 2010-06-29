#!/bin/bash
# Marcin Pohl, June 28th, 2010
# this script takes a param on commandline to look up a SSL certificate's 
#   properties

CONNECTSTRING="$1"
echo "quit" | 
	openssl s_client -nbio -connect $CONNECTSTRING 2>/dev/null |
	awk '/-----BEGIN CERTIFICATE-----/, /-----END CERTIFICATE-----/'  | 
	openssl x509 -inform PEM -noout -subject -dates
