#!/usr/bin/env bash

openssl x509 -in ca.crt -noout -subject_hash
# 9da13359
ln -s ca.crt 9da13359.0
ls -l
