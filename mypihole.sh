# Create a podman volume to hold pihole configuration files
podman volume create pihole
# Pull the image
podman pull docker.io/pihole/pihole
# Run the image the first time, use google foo to research and solve any port conflict issues
podman run -dt --name pihole -p 192.168.1.210:53:53/udp -p 192.168.1.210:53:53/tcp -p 192.168.1.210:80:80/tcp -e DNS1=149.112.112.112 -e DNS2=9.9.9.9 -e TZ=America/New_York -v pihole:/etc/pihole:Z -e WEBPASSWORD=letmein docker.io/pihole/pihole
# Stop the container temporarily
podman stop pihole
# Create the systemd configuration so pihole container can run as a systemd service upon boot. May have to ' su' to execute the next line as root
podman generate systemd pihole > /etc/systemd/system/pihole-container.service
# Refresh systemd
systemctl daemon-reload
# Enable pihole container to as auto run as a systemd service
systemctl enable pihole-container
# Start pihole as a container from systemd
systemctl start pihole-container
