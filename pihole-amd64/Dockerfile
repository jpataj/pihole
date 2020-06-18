FROM pihole/pihole:latest
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y supervisor
RUN wget https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.deb
RUN apt-get install ./cloudflared-stable-linux-amd64.deb
COPY pihole-amd64/config.yml /etc/cloudflared/config.yml
COPY pihole-amd64/cloudflare.sh .
COPY pihole-amd64/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN cloudflared service install
CMD ["/usr/bin/supervisord", "-n"]
