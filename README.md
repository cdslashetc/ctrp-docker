# ctrp-docker
Tools to build CTRP-AUM in docker containers.

## Default Settings
* RAILS_ENV=development
  * valid values: *development production qa test*
* GITHUB_TAG=develop

## To begin with custom settings
```bash
cp ctrp-env.sh.in ctrp-env.sh
```
Then customize *ctrp-env.sh* before running startup script(s).

### Notes
* use [phusion/passenger-ruby22/](https://hub.docker.com/r/phusion/passenger-ruby22/) as a base image instead of [ubuntu:14.04](https://hub.docker.com/_/ubuntu/)
  * contains functional *init* process
  * avoids PID 1 zombie problem with memory leaks
  * contains most of the software prerequisites
  * is actively maintained and developed by Phusion, makers of Passenger
  * eliminates unnecessary daemons and system processes
* make use of environmental variables as much as possible
* abstract out build env rather than specialized Dockerfile for each one
* put sensible defaults in ctrp-env.sh.in and have user customize
* *mysecretpassword* is not the real password but set in ctrp-env.sh
* ctrp-env.sh is excluded from Github
* load database from application container
  * makes it easy to use postgres running on host instead
  * makes it easy to use Enterprise postgres instead
  * postgres container does not require special Dockerfile
* manual_phusion.txt notes from sample manual build with phusion/passenger-ruby22
