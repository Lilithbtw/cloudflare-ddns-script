# DDNS Cloudflare Script
## Requirements
* wget for installation
* bash
* crontab
* curl
* Cloudfare API KEY with ZONE-DNS-EDIT Permissions
* DNS Record must be pre created
* Domain and Record ID
## How to Request Cloudfare API KEY
To create a CloudFlare API token for your DNS zone go to https://dash.cloudflare.com/profile and follow these steps:
1. Go to API TOKENS
2. Click Create Token
3. Click 'Edit zone DNS' from the templates
   - On zone Resources click your zone (your domain)
   - And Click 'Continue to Summary'
4. Click 'Create Token'
5. Copy/Paste your API KEY to 'CLOUDFLARE_API_KEY='
## How to see Domain ID
1. Go to manage account
2. Go to Audit Log
3. Click on the logs until you find one with the resource name dnssec.dns_settings
4. Copy the resource ID from that log
5. Paste the resource ID on 'DOMAIN='
## How to see Record ID
1. Go to manage account
2. Go to Audit Log
3. Click on the logs until you find one with the resource name dns.record 
4. Copy the resource ID from that log
5. Paste the resource ID on 'RECORD='
## How to Install and start configuring
For starters let's install all the dependencies you can do that using the package manager of your choice in this case we will use apt
```bash
sudo apt install wget crontab curl 
```
You can place the script at any location manually.
```bash
wget https://raw.githubusercontent.com/Lilithbtw/cloudfare-ddns-script/main/cloudflare-dyndns.sh
sudo chmod +x cloudflare-dyndns.sh
sudo nano cloudflare-dyndns.sh
```
To test if it's working run it (if it runs without errors it's working)
```bash
./cloudflare-dyndns.sh
```
to run this script every 5 minutes
```bash
crontab -e
```
and paste 
```bash
*/5 * * * * /your-path/cloudflare-dyndns.sh
```
