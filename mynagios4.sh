podman volume create nagios-etc
podman volume create nagios-var
podman volume create Custom-Nagios-Plugins
podman volume create nagiosgraph-etc
podman volume create nagiosgraph-var

podman run -d --name nagios4  \
  --mount type=volume,source=nagios-etc,destination=/opt/nagios/etc \
  --mount type=volume,source=nagios-var,destination=/opt/nagios/var \
  --mount type=volume,source=Custom-Nagios-Plugins,destination=/opt/Custom-Nagios-Plugins \
  --mount type=volume,source=nagiosgraph-etc,destination=/opt/nagiosgraph/etc \
  --mount type=volume,source=nagiosgraph-var,destination=/opt/nagiosgraph/var \
  -p 0.0.0.0:8080:80 jasonrivers/nagios:latest

