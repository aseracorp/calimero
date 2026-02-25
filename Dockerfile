FROM calimeroproject/knxserver

WORKDIR /usr/app

COPY --chmod=0755 entrypoint.sh .

ENV FRIENDLY_NAME="Calimero KNXnet/IP-Router"
ENV NAME="calimero-knxserver"
ENV PHYS_ADDRESS="0.1.0"
ENV DISCOVERY="true"
ENV DISCOVERY_LISTEN_IF="all"
ENV DISCOVERY_OUT_IF="all"
ENV LISTEN_IF="any"
ENV SERIAL_PORT="/dev/ttyKNX"
ENV ADDITIONAL_ADDRESS1="0.1.1"
ENV ADDITIONAL_ADDRESS2="0.1.2"
ENV ADDITIONAL_ADDRESS3="0.1.3"
ENV ADDITIONAL_ADDRESS4="0.1.4"
ENV ADDITIONAL_ADDRESS5="0.1.5"
ENV SUBNET_TYPE="tpuart"

RUN apk update && apk add yq

ENTRYPOINT ["/usr/app/entrypoint.sh"]
CMD ["calimero-server/bin/calimero-server", "--no-stdin", "/usr/app/server-config.xml"]