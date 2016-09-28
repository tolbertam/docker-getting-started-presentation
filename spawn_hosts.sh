#!/bin/bash
for i in {1..10}; do
    HOST=host${i}
    echo "Starting $HOST"
    docker run -e HOST_NAME=$HOST \
    -e GRAPHITE_HOST=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' grafana) \
    -e GRAPHITE_PORT=2003 \
    -e COLLECT_INTERVAL=1 \
    -d --name $HOST andreasjansson/collectd-write-graphite
done
