#!/bin/bash

set -e 
mc --insecure alias set s3proxy-test https://s3.kind-ingress demouser demouser123 --api S3v4
date > /tmp/qa-file.txt
mc --insecure mb s3proxy-test/qa-test
mc --insecure cp /tmp/qa-file.txt s3proxy-test/qa-test/
mc --insecure rm s3proxy-test/qa-test/qa-file.txt
mc --insecure rb s3proxy-test/qa-test 
mc --insecure alias rm s3proxy-test
