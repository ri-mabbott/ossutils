#!/bin/bash
set -e

if [ "$1" = 'ossutil64' ]; then
    ossutil64 config --endpoint ${OSS_ENDPOINT} --access-key-id ${OSS_ACCESS_KEY_ID} --access-key-secret ${OSS_ACCESS_KEY_SECRET} --language EN
fi

exec "$@"