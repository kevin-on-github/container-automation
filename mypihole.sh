#!/bin/bash

# Pull the image
podman pull docker.io/pihole/pihole:latest

# Create a podman volume to hold pihole configuration files
podman volume create pihole

# Run the container. Make sure to edit this for password and timezone.
podman run -d --name pihole \
  -p 53:53/udp -p 53:53/tcp -p 80:80/tcp \
  -e DNS1=149.112.112.112 -e DNS2=9.9.9.9 -e TZ=<timezone here> \
  -e WEBPASSWORD=<admin password here>
  --mount type=volume,source=pihole,destination=/etc/pihole \
  --restart=always
  docker.io/pihole/pihole
