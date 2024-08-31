#!/bin/bash

## Define your Cloudflare API key and email
CLOUDFLARE_API_KEY=
CLOUDFLARE_EMAIL=

## Define the domain and record you want to update
DOMAIN=
RECORD=

## Get the current public IP address
IP=$(curl -s https://cloudflare.com/cdn-cgi/trace | grep -E '^ip' | cut -d = -f 2)

## Get the current IP address on Cloudflare
CF_IP=$(curl -s https://api.cloudflare.com/client/v4/zones/$DOMAIN/dns_records/$RECORD \
  -H "X-Auth-Email: $CLOUDFLARE_EMAIL" \
  -H "Authorization: Bearer $CLOUDFLARE_API_KEY" \
  -H "Content-Type: application/json" \
  | jq '.result.content' \
  | tr -d \")

## Update the IP address on Cloudflare if it has changed
if [ "$IP" != "$CF_IP" ]; then
  curl -s https://api.cloudflare.com/client/v4/zones/$DOMAIN/dns_records/$RECORD \
    -X PUT \
    -H "X-Auth-Email: $CLOUDFLARE_EMAIL" \
    -H "Authorization: Bearer $CLOUDFLARE_API_KEY" \
    -H "Content-Type: application/json" \
    --data "{\"type\":\"A\",\"name\":\"$RECORD\",\"content\":\"$IP\"}"
fi
