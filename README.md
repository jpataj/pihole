# Overview
This [repository](https://github.com/jpataj/pihole) provides source files to build custom **Pi-hole docker images** which are based on [official docker Pi-hole](https://hub.docker.com/r/pihole/pihole) with addition to use [cloudflare DNS over HTTPs](https://docs.pi-hole.net/guides/dns-over-https/).


# How to run Docker Pi-hole for ARM (Rapsberry Pi)

The only change you need to do to run my version is to replace ***pihole/pihole:latest*** with ***jpataj/pihole-arm:latest***  in [Docker-compose example](https://hub.docker.com/r/pihole/pihole) or  [Docker run script](https://github.com/pi-hole/docker-pi-hole/blob/master/docker_run.sh). Below are examples of docker run command.

## Docker run
```
docker run -d \
    --name pihole \
    -p 53:53/tcp -p 53:53/udp \
    -p 80:80 \
    -p 443:443 \
    -e TZ="America/Chicago" \
    -v "$(pwd)/etc-pihole/:/etc/pihole/" \
    -v "$(pwd)/etc-dnsmasq.d/:/etc/dnsmasq.d/" \
    --dns=127.0.0.1 --dns=1.1.1.1 \
    --restart=unless-stopped \
    --hostname pi.hole \
    -e VIRTUAL_HOST="pi.hole" \
    -e PROXY_LOCATION="pi.hole" \
    -e ServerIP="127.0.0.1" \
    jpataj/pihole-arm:latest
```

## Docker-compose

```
version: "3"

# More info at https://github.com/pi-hole/docker-pi-hole/ and https://docs.pi-hole.net/
services:
  pihole:
    container_name: pihole
    image: jpataj/pihole-arm:1
    ports:
      - "53:53/tcp"
      - "53:53/udp"
      - "67:67/udp"
      - "80:80/tcp"
      - "443:443/tcp"
    environment:
      TZ: 'America/Chicago'
      # WEBPASSWORD: 'set a secure password here or it will be random'
    # Volumes store your data between container upgrades
    volumes:
       - './etc-pihole/:/etc/pihole/'
       - './etc-dnsmasq.d/:/etc/dnsmasq.d/'
    dns:
      - 127.0.0.1
      - 1.1.1.1
    # Recommended but not required (DHCP needs NET_ADMIN)
    #   https://github.com/pi-hole/docker-pi-hole#note-on-capabilities
    cap_add:
      - NET_ADMIN
    restart: unless-stopped
```


## Links to Docker images
* https://hub.docker.com/repository/docker/jpataj/pihole-amd64
* https://hub.docker.com/repository/docker/jpataj/pihole-arm
