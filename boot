#!/usr/bin/env bash
SEP="======================================================"

echo "Prerender Token: $PRERENDER_TOKEN"

confd -onetime -backend env

echo "Wrote nginx config..."
echo $SEP
cat /etc/nginx/nginx.conf
echo $SEP

nginx
