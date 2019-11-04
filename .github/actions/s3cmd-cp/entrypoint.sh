#!/bin/sh

set -e

# Create basic config for s3cmd
echo "[default]
access_key = ${AWS_ACCESS_KEY_ID}
bucket_location = sfo2
check_ssl_certificate = True
check_ssl_hostname = True
guess_mime_type = True
host_base = ${AWS_ENDPOINT}
host_bucket = %(bucket)s.${AWS_ENDPOINT}
secret_key = ${AWS_SECRET_ACCESS_KEY}" > ~/.s3cfg

s3cmd ls
