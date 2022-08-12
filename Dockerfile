FROM ttbb/base:go AS build
COPY . /opt/sh/compile
WORKDIR /opt/sh/compile/pkg
RUN go build -o filebeat_mate .


FROM ttbb/filebeat:nake

COPY docker-build /opt/sh/filebeat/mate

COPY --from=build /opt/sh/compile/pkg/filebeat_mate /opt/sh/filebeat/mate/filebeat_mate

WORKDIR /opt/sh/filebeat

CMD ["/usr/bin/dumb-init", "bash", "-vx", "/opt/sh/filebeat/mate/scripts/start.sh"]
