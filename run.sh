#!/bin/sh
set -eo pipefail
SCRIPTDIR="$(cd "$(dirname "$1")"; pwd -P)"
PORT=8888
echo "Running from $SCRIPTDIR"
docker build -t julia-binder .
docker run --mount type=bind,src=$SCRIPTDIR/notebooks,dst=/home/jovyan/notebooks -p 127.0.0.1:$PORT:$PORT julia-binder
