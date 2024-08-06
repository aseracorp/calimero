This is a wrapper for the official calimero docker build including an entrypoint-script downloading the server-config.xml and exposing some env vars to overwrite the config-file:

Exposed Envs with default values:
---
        FRIENDLY_NAME="Calimero KNXnet/IP-Router"
        NAME="calimero-knxserver"
        PHYS_ADDRESS="7.1.0"
        DISCOVERY="true"
        DISCOVERY_LISTEN_IF="all"
        DISCOVERY_OUT_IF="all"
        LISTEN_IF="eth0"
        SERIAL_PORT="/dev/ttyKNX"
        ADDITIONAL_ADDRESS1="7.1.1"
        ADDITIONAL_ADDRESS2="7.1.2"
        ADDITIONAL_ADDRESS3="7.1.3"
        ADDITIONAL_ADDRESS4="7.1.4"
        ADDITIONAL_ADDRESS5="7.1.5"

If you want to change some other settings, you still have to mount your own server-config.xml to /usr/app/server-config.xml