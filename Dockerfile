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
ENV NET_IF="any"
ENV SERIAL_PORT="/dev/ttyKNX"
ENV ADDITIONAL_ADDRESS1="7.1.1"
ENV ADDITIONAL_ADDRESS2="7.1.2"
ENV ADDITIONAL_ADDRESS3="7.1.3"
ENV ADDITIONAL_ADDRESS4="7.1.4"
ENV ADDITIONAL_ADDRESS5="7.1.5"
ENV SUBNET_TYPE="tpuart"
ENV CUSTOM_XML=false

#fix JAVA_HOME is set to an invalid directory: /usr/lib/jvm/jdk-21
ENV JAVA_HOME=/usr/lib/jvm/jdk-23
ENV PATH=/usr/lib/jvm/jdk-23/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN apk update && apk add yq

ENTRYPOINT ["/usr/app/entrypoint.sh"]
CMD ["calimero-server-3.0-SNAPSHOT/bin/calimero-server", "--no-stdin", "/usr/app/server-config.xml"]