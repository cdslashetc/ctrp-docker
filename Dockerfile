FROM phusion/passenger-ruby22
MAINTAINER jonathan.dill@nih.gov

RUN apt-get update && apt-get -y dist-upgrade && apt-get -y install postgresql-client
RUN git clone --branch S14 https://github.com/cbiit/ctrp /local/content/ctrp/apps/ctrp
