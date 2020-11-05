#!/usr/bin/env sh
set -e

PROCESSED=false
WORKDIR=/workdir
PROCESSEDDIR=/processed

for path in "$WORKDIR"/*; do
  if [ -f "$path" ]; then
    echo "Processing $path ..."
    envsubst < "$path" > "$PROCESSEDDIR/$(basename "$path")"
    PROCESSED=true
  fi
done

ls "$PROCESSEDDIR"

if [ ! $PROCESSED = true ]; then
  echo 'No files processed'
  exit 1
fi
