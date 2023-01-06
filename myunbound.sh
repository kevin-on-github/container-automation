#!/bin/bash

# Pull the image
podman pull docker.io/mvance/unbound:latest

# Create a podman volume to hold unbound configuration files
podman volume create unbound

# Run the image the first time, use google foo to research and solve any port conflict issues
podman run --name unbound -d \
  -p 5335:53/udp -p 5335:53/tcp \
  -z unbound:/opt/unbound/etc/unbound \
  --restart=always \
  mvance/unbound:latest
