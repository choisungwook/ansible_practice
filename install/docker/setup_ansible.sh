#!/bin/bash

N=$1

# Check if the number of arguments is provided
if [ -z "$N" ]; then
  echo "Usage: $0 <number_of_nodes>"
  exit 1
fi

rm -rf ~/.ssh/known_hosts
for ((i=0; i<N; i++)); do
  ssh-keyscan ansible-node${i} >> ~/.ssh/known_hosts
done
