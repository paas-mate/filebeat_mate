FROM ttbb/base:go AS build
COPY . /compile
WORKDIR /compile/pkg
RUN go build -o filebeat_mate .


FROM ttbb/filebeat:nake

RUN mv /opt/filebeat/filebeat.yml /opt/filebeat/filebeat.original.yml

COPY docker-build /opt/filebeat/mate

COPY --from=build /compile/pkg/filebeat_mate /opt/filebeat/mate/filebeat_mate

WORKDIR /opt/filebeat

CMD ["/usr/bin/dumb-init", "bash", "-vx", "/opt/filebeat/mate/scripts/start.sh"]
