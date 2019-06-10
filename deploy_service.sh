#!/bin/bash
NETWORK=$(docker network ls | grep starter-network | awk '{print $2}')   
if [[ $NETWORK == "starter-network" ]]; then
	echo "starter-network created..."
else
	docker network create -d overlay  starter-network
fi
env $(cat .env | grep ^[A-Z] | xargs) docker stack deploy --with-registry-auth -c starter-service-stack.yml starter


