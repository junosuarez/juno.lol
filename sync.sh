#! /bin/bash

BUCKET=suarez-www
CDN=EA6UPFC4XHI58

# if [[ ! -z $(git status -s) ]]; then
#  echo 'commit your changes first'
#  exit 1
# fi

aws s3 cp . "s3://$BUCKET" --recursive \
  --exclude '.git/*' \
  --exclude package.json \
  --exclude CNAME \
  --exclude README.md \
  --exclude *.sh

aws cloudfront create-invalidation \
  --distribution-id $CDN \
  --paths /
