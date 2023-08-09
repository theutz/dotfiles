#!/bin/sh

if command -v yum; then
	sudo yum update -y
	sudo yum install -y epel-release \
		yum-utils \
		age
fi
