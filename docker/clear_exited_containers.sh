#!/bin/bash

# List all exited Docker containers
exited_containers=$(docker ps -a --filter "status=exited" -q)

if [ -z "$exited_containers" ]; then
  echo "No exited containers found."
else
  echo "Exited containers:"
  echo "$exited_containers"

  # Delete exited containers
  echo "Deleting exited containers..."
  docker rm $exited_containers
  echo "Deleted exited containers."
fi
