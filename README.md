# docker-nginx-ssl-demo

docker-nginx-ssl-demo is a demo for deploying https with nginx in docker, using Letsencrypt and self-signed certificate respectively.

## Prerequisite

* a linux machine with 443 and 80 port available from Internet
* Docker Engine and Docker Compose(version >= 1.6.0)
* a domain with a A record resolved to your machine's IP

## Quick Start

### Using LetsEncrypt

1. get certificate from letsencrypy using cerbot

  ```
  cd docker-nginx-letsencrypt-ssl
  ./get_cert.sh
  ```

following its guide and giving your configuration, and you will get your certificates in `nginx/letsencrypt`.

2. replace {your_domain} with your domain in `nginx/default.conf`.

  ```
  nano nginx/default.conf
  
  server {
    listen 443 ssl;

    root /usr/share/nginx/html;
    index index.html index.htm;

    server_name {your_domain};

    ssl on;
    ssl_certificate /etc/letsencrypt/live/{your_domain}/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/{your_domain}/privkey.pem;

    location / {
      try_files $uri $uri/ =404;
    }
  }
  ```
  
  3. build the container and run it, using the bash script:
  ```
  ./deploy.sh
  ```
  and now you can visit your domin with https.
  
  4. update your certificate before it expires. (optional)
  ```
  ./update_cert.sh
  ```
  
  5. stop the container and clean it.
  ```
  ./destroy.sh
  ```
  
  ### Using self-signed certificate
  
  almost same as the steps of letsencrypt
