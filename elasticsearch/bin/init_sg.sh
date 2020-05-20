#!/usr/bin/env sh

plugins/search-guard-7/tools/sgadmin.sh \
	-cd config/sg/ \
	-key config/sg/certificates/kirk-key.pem \
	-cert config/sg/certificates/kirk.pem \
	-cacert config/sg/certificates/root-ca.pem\
	-nhnv \
	-icl
