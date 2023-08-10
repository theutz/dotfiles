#!/bin/sh

if command -v yum; then
	sudo yum update -y
	sudo yum install -y epel-release \
		yum-utils \
		git

	# install age for encryption
	curl --location --output age.tar.gz 'https://dl.filippo.io/age/latest?for=linux/amd64' &&
		tar xzf age.tar.gz &&
		mv age/age age/age-keygen ~/bin &&
		rm -rf age.tar.gz age
fi
