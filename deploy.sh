#!/usr/bin/env bash

APP_HOST={ip_address}
REMOTE_DIR=/root/{app_name}
RSYNC_FLAGS="--exclude=.idea --exclude=venv
    --exclude=.git
    --exclude=node_modules
    -av
    --delete"

# build frontend
# rm -rf build &&
# npm install && npm run build &&

# build / deploy
rsync ${RSYNC_FLAGS} . root@${APP_HOST}:${REMOTE_DIR} &&
ssh root@${APP_HOST} "cd ${REMOTE_DIR} && docker build -t {app_name}:latest ."
ssh root@${APP_HOST} "cd ${REMOTE_DIR} && docker stop {app_name}"
ssh root@${APP_HOST} "cd ${REMOTE_DIR} && docker --name {app_name} --rm -d -p 5000:5000 -t {app_name}:latest"