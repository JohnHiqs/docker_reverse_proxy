#!/bin/bash
#Helper Script for composing the docker and nginx.conf use and abuse at your own risk JohnHiqs
usage() {
  echo "Usage: $0 [-x]"
  echo
  echo "This script stops all running Docker containers, kills them if stopping"
  echo "was unsuccessful, and removes all containers regardless of their state."
  echo
  echo "Options:"
  echo "  -x    Skip the sleep and docker-compose up -d commands at the end."
  echo "        (By default, the script will sleep for 5 seconds and then"
  echo "         restart containers using docker-compose up -d)"
}

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  usage
  exit 0
fi

# Function to stop and kill container if stopping is unsuccessful
stop_and_kill_if_unsuccessful() {
  container_id=$1
  docker stop $container_id
  if [ $? -ne 0 ]; then
    echo "Stopping $container_id failed, attempting to kill it."
    docker kill $container_id
  fi
}

# Get all running container IDs
running_containers=$(docker ps -q)

# Stop and kill containers if stopping is unsuccessful
for container_id in $running_containers; do
  stop_and_kill_if_unsuccessful $container_id
done

# Remove all containers
docker rm $(docker ps -a -q)

if [ "$1" != "-x" ]; then
  sleep 5

  # Start the docker-compose file again
  docker-compose up -d
fi
### EOF
