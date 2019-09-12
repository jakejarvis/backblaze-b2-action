#!/bin/sh

set -e

if [ -z "$B2_BUCKET" ]; then
  echo "B2_BUCKET is not set. Quitting."
  exit 1
fi

if [ -z "$B2_APPKEY_ID" ]; then
  echo "B2_APPKEY_ID is not set. Quitting."
  exit 1
fi

if [ -z "$B2_APPKEY" ]; then
  echo "B2_APPKEY is not set. Quitting."
  exit 1
fi

if [ -z "$SOURCE_DIR" ]; then
  echo "SOURCE_DIR is not set. Quitting."
  exit 1
fi

b2 authorize-account ${B2_APPKEY_ID} ${B2_APPKEY}

b2 sync --delete --replaceNewer ${SOURCE_DIR} ${B2_BUCKET}

# TO-DO: Delete old versions of updated files because that's what
# we're already using GitHub for... but B2 doesn't make this easy:
# https://github.com/Backblaze/B2_Command_Line_Tool/issues/324

b2 clear-account
