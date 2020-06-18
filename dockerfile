FROM pihole/pihole:latest
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y supervisor
RUN wget https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-arm.tgz
RUN tar -xvzf cloudflared-stable-linux-arm.tgz -C /usr/local/bin
RUN chmod +x /usr/local/bin/cloudflared
COPY config.yml /etc/cloudflared/config.yml
COPY cloudflare.sh .
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN cloudflared service install
CMD ["/usr/bin/supervisord", "-n"]
