FROM ttbb/filebeat:nake

RUN mv /opt/filebeat/filebeat.yml /opt/filebeat/filebeat.original.yml

COPY docker-build /opt/filebeat/mate

WORKDIR /opt/filebeat

CMD ["/usr/bin/dumb-init", "bash", "-vx", "/opt/filebeat/mate/scripts/start.sh"]
