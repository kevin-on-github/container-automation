docker volume create portainer_data
docker run -d \
  -p 192.168.1.210:8000:8000 -p 192.168.1.2109000:9000 \
  --name=portainer --restart=always --pull=always \
  -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data \
  portainer/portainer-ce

