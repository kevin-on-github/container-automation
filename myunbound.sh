# Create a podman volume to hold unbound configuration files
podman volume create unbound
# Pull the image
podman pull docker.io/mvance/unbound:latest
# Run the image the first time, use google foo to research and solve any port conflict issues
podman run --name unbound -d \
  -p 192.168.1.210:5335:53/udp -p 192.168.1.210:5335:53/tcp \
  -v unbound:/opt/unbound/etc/unbound:Z \
  --ip 10.88.0.5 \
  --restart=always mvance/unbound:latest
# Stop the container temporarily
podman stop unbound
# Create the systemd configuration so unbound container can run as a systemd service upon boot. May have to ' su' to execute the next line as root
podman generate systemd unbound > /etc/systemd/system/unbound-container.service
# Refresh systemd
systemctl daemon-reload
# Enable unbound container to as auto run as a systemd service
systemctl enable unbound-container
# Start unbound as a container from systemd
systemctl start unbound-container
