#!/bin/bash
docker run -it --rm -p 443:443 -p 80:80 -v $('pwd')/nginx/letsencrypt:/etc/letsencrypt certbot/certbot certonly
