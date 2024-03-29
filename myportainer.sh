#!/bin/bash

# Pull the latest image
podman pull docker.io/portainer/portainer-ce:latest

# Create the container volume 
podman volume create portainer_data

# Run the container.
podman run -d \
    -p 9443:9443 --privileged \
    -v /run/podman/podman.sock:/var/run/docker.sock:Z \
    --mount type=volume,source=portainer_data,destination=/data \
    portainer/portainer-ce

# Note the path to podman.sock. Will have to manually specify this in the portainer endpoint configuration.
