#!/bin/bash
if [ ! -r ctrp-env.sh ]; then
  cp -f ctrp-env.sh.in ctrp-env.sh
fi
. ctrp-env.sh
if [ -z ${RAILS_ENV+x} ]; then
  export RAILS_ENV=development
  export GITHUB_TAG=develop
fi
if [ -z ${GITHUB_TAG+x} ]; then export GITHUB_TAG=develop; fi
if [ -z ${POSTGRES_PASSWORD+x} ]; then export POSTGRES_PASSWORD=mysecretpassword; fi
if [ -z ${POSTGRES_USER+x} ]; then export POSTGRES_USER=docker; fi
if [ -z ${POSTGRES_DB+x} ]; then export POSTGRES_DB=docker; fi
docker run --name ctrp-postgres_${RAILS_ENV}_${GITHUB_TAG} \
  -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
  -e POSTGRES_USER=$POSTGRES_USER \
  -e POSTGRES_DB=$POSTGRES_DB \
  -d postgres:9.4
