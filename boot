#!/usr/bin/env bash
SEP="======================================================"

echo "SPA: $SPA_URL"
echo "Prerender Token: $PRERENDER_TOKEN"
echo $SEP

confd -onetime -backend env

echo "Wrote nginx config..."
echo $SEP
cat /etc/nginx/nginx.conf
echo $SEP

nginx
