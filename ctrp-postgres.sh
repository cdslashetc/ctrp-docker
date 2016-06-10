#!/bin/bash
if [ -r ../ctrp-env.sh ]; then . ../ctrp-env.sh; fi
if [ -z ${RAILS_ENV+x} ]; then export RAILS_ENV=qa; fi
if [ -z ${POSTGRES_TAG+x} ]; then export POSTGRES_TAG=$RAILS_ENV; fi
if [ -z ${POSTGRES_PASSWORD+x} ]; then export POSTGRES_PASSWORD=mysecretpassword; fi
if [ -z ${POSTGRES_USER+x} ]; then export POSTGRES_USER=docker; fi
if [ -z ${POSTGRES_DB+x} ]; then export POSTGRES_DB=docker; fi
docker run --name ctrp-postgres_${POSTGRES_TAG} \
  -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
  -e POSTGRES_USER=$POSTGRES_USER \
  -e POSTGRES_DB=$POSTGRES_DB \
  -d postgres:9.4
