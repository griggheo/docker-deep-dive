#!/bin/bash

nerdctl run --name nerdctl-nginx -p 8080:80 -d nginx:alpine
nerdctl ps

nerdctl kill nerdctl-nginx
nerdctl ps
