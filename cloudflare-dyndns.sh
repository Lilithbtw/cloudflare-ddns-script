#!/bin/bash

## Define your Cloudflare API key and email
CLOUDFLARE_API_KEY=
CLOUDFLARE_EMAIL=

## Define the domain and record you want to update
DOMAIN=
RECORD=

#Define the Variables
RECORD_NAME=""        # Which record you want to be synced
TTL=3600              # Set the DNS TTL (seconds)
PROXY=""							# Set the proxy to true or false

## Get the current public IP address
IP=$(curl -s https://cloudflare.com/cdn-cgi/trace | grep -E '^ip' | cut -d = -f 2)

# Get the current IP address on Cloudflare
CF_IP=$(curl -s https://api.cloudflare.com/client/v4/zones/$DOMAIN/dns_records/$RECORD \
  -H "X-Auth-Email: $CLOUDFLARE_EMAIL" \
  -H "Authorization: Bearer $CLOUDFLARE_API_KEY" \
  -H "Content-Type: application/json" \
  | jq '.result.content' \
  | tr -d \")

## Update the IP address on Cloudflare if it has changed
if [ "$IP" != "$CF_IP" ]; then
  update=$(curl -s -X PATCH "https://api.cloudflare.com/client/v4/zones/$DOMAIN/dns_records/$RECORD" \
     -H "X-Auth-Email: $CLOUDFLARE_EMAIL" \
     -H "Authorization: Bearer $CLOUDFLARE_API_KEY" \
     -H "Content-Type: application/json" \
     --data "{\"type\":\"A\",\"name\":\"$RECORD_NAME\",\"content\":\"$IP\",\"ttl\":$TTL,\"proxied\":${PROXY}}")
fi

