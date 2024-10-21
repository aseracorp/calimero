FROM calimeroproject/knxserver

WORKDIR /usr/app

COPY server-config.xml .
COPY --chmod=0755 entrypoint.sh .

ENV FRIENDLY_NAME="Calimero KNXnet/IP-Router"
ENV NAME="calimero-knxserver"
ENV PHYS_ADDRESS="7.1.0"
ENV DISCOVERY="true"
ENV DISCOVERY_LISTEN_IF="all"
ENV DISCOVERY_OUT_IF="all"
ENV LISTEN_IF="eth0"
ENV SERIAL_PORT="/dev/ttyKNX"
ENV ADDITIONAL_ADDRESS1="7.1.1"
ENV ADDITIONAL_ADDRESS2="7.1.2"
ENV ADDITIONAL_ADDRESS3="7.1.3"
ENV ADDITIONAL_ADDRESS4="7.1.4"
ENV ADDITIONAL_ADDRESS5="7.1.5"
ENV SUBNET_TYPE="tpuart"

ENTRYPOINT ["/usr/app/entrypoint.sh"]
CMD ["calimero-server-3.0-SNAPSHOT/bin/calimero-server", "--no-stdin", "/usr/app/server-config.xml"]