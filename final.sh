#!/bin/bash

CONTAINER_ID="68384d08fff7"
CONTAINER_DIR="/home/doc-bd-a1/"
HOST_DIR="./service-result/"

mkdir -p $HOST_DIR

FILES_TO_COPY=$(docker exec $CONTAINER_ID bash -c "find $CONTAINER_DIR -maxdepth 1 -type f ! -name '*.csv' ! -name '*.py' ! -name '__pycache__'")

for FILE in $FILES_TO_COPY; do
    FILENAME=$(basename $FILE)
    docker cp $CONTAINER_ID:$FILE $HOST_DIR$FILENAME
done

docker stop $CONTAINER_ID

echo "files copied to $HOST_DIR and container $CONTAINER_ID stopped."
