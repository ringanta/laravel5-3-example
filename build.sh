
#!/bin/bash

set -xe

compose(){
    docker-compose -f docker-compose.build.yml "$@"
}

COMMAND=${@:-./gradlew build dist}

WORKDIR=$(pwd)
export WORKDIR=$WORKDIR

cp .env.example .env
compose build
compose run --rm -u $(id -u) gradle $COMMAND

