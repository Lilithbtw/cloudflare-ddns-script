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
## [License](https://choosealicense.com/licenses/mit/)

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
