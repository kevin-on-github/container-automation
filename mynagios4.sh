#!/bin/bash

#First pull the latest image.
podman pull docker.io/jasonrivers/nagios:latest

# Create volumes on the host for the container. Allows the container to be destroyed and rebuilt without losing configs. \
# Also can edit the container's configuration files directly.
podman volume create nagios-etc
podman volume create nagios-var
podman volume create Custom-Nagios-Plugins
podman volume create nagiosgraph-etc
podman volume create nagiosgraph-var

# The port can be modified, and additional modifiers as needed. This works as a basic setup.
podman run -d --name nagios4  \
  --mount type=volume,source=nagios-etc,destination=/opt/nagios/etc \
  --mount type=volume,source=nagios-var,destination=/opt/nagios/var \
  --mount type=volume,source=Custom-Nagios-Plugins,destination=/opt/Custom-Nagios-Plugins \
  --mount type=volume,source=nagiosgraph-etc,destination=/opt/nagiosgraph/etc \
  --mount type=volume,source=nagiosgraph-var,destination=/opt/nagiosgraph/var \
  -p 0.0.0.0:8080:80 jasonrivers/nagios:latest