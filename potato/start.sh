#!/bin/sh

set -e

wait-for-it.sh rabbitmq:5672
wait-for-it.sh couchdb:5984
wait-for-it.sh memcached:11211

cd /potato/potato

if ! (curl -fs -o /dev/null http://couchdb:5984/potato/_design/channel) ; then
    echo "Database not initialised. Creating views."
    ./potato.bin -c /potato/potato.cfg --init
fi

echo "Starting server"

exec ./potato.bin -c /potato/potato.cfg "$@"
