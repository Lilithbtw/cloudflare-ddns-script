# DDNS Cloudflare Script
## Requierments
* wget for installation
* bash
* curl
* Cloudfare API KEY with ZONE-DNS-EDIT Permissions
* DNS Record must be pre created
* Domain and Record ID
## How to Request Cloudfare API KEY
To create a CloudFlare API token for your DNS zone go to https://dash.cloudflare.com/profile/api-tokens and follow these steps:
1. Go to your profile
2. Go to API TOKENS
3. Click Create Token
4. Click 'Edit zone DNS' from the templates
   - On zone Resources click your zone (your domain)
   - And Click 'Continue to Summary'
5. Click 'Create Token'
6. Copy/Paste your API KEY to 'CLOUDFLARE_API_KEY='
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
You can place the script at any location manually.
```bash
wget https://raw.githubusercontent.com/Lilithbtw/cloudfare-ddns-script/main/cloudflare-dyndns.sh
sudo chmod +x cloudflare-dyndns.sh
sudo nano cloudflare-dyndns.sh
```
## License
[MIT](https://choosealicense.com/licenses/mit/)