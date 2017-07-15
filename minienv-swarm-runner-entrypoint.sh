#!/bin/sh

export DIND_IP_ADDRESS="$(ip route show | grep docker0 | awk '{print $5}')"

# Run the Proxy
/app 80 &

# Run minienv
cd /dc
sed -i -e 's/\$volumeName/'${MINIENV_VOLUME_NAME}'/g' docker-compose.yml
docker-compose up


