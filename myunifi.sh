###
# This will pull an OLD version of unifi that works with my old UAC-Pro square AP.
# If you ever get a newer AP, then by all means change the version to latest.
###

docker run -d \
  --name=unifi-controller \
  -e TZ='America/New_York' \
  -p 192.168.1.211:8443:8443 \
  -p 192.168.1.211:3478:3478/udp \
  -p 192.168.1.211:8080:8080 \
  -v "unifi:/unifi" \
  --restart unless-stopped \
  jacobalberty/unifi:5.6.39
