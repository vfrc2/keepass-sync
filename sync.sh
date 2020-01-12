#!/bin/bash

rclone=/usr/bin/rclone
# Sync keepass file
KEEPASS_FILE_NAME=main.kdbx

# from local
LOCAL_TARGET=~/.keepass
#LOCAL_TARGET=local
#to cloud
CLOUD_TARGET=gdrive:keepass
#CLOUD_TARGET=target

# if cloud file older when local, when make a local backup with date 
# and replace local file with cloud
# else update cloud file with local

# sync cloud to local skiping newer file in local
rclone sync $CLOUD_TARGET $LOCAL_TARGET --update --include $KEEPASS_FILE_NAME --drive-use-trash --verbose

#sync back
rclone sync $LOCAL_TARGET $CLOUD_TARGET --update --include $KEEPASS_FILE_NAME --drive-use-trash --verbose
