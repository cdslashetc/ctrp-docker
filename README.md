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