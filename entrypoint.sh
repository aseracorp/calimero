#!/bin/sh
# entrypoint.sh

#replace values with env-vars from cosmos-installer
echo "Set configuration..."
sed -i 's~FRIENDLY_NAME~'"$FRIENDLY_NAME"'~g' /usr/app/server-config.xml
sed -i 's~NAME~'"$NAME"'~g' /usr/app/server-config.xml
sed -i 's~PHYS_ADDRESS~'"$PHYS_ADDRESS"'~g' /usr/app/server-config.xml
sed -i 's~DISCOVERY_LISTEN_IF~'"$DISCOVERY_LISTEN_IF"'~g' /usr/app/server-config.xml
sed -i 's~DISCOVERY_OUT_IF~'"$DISCOVERY_OUT_IF"'~g' /usr/app/server-config.xml
sed -i 's~DISCOVERY~'"$DISCOVERY"'~g' /usr/app/server-config.xml
sed -i 's~LISTEN_IF~'"$LISTEN_IF"'~g' /usr/app/server-config.xml
sed -i 's~SERIAL_PORT~'"$SERIAL_PORT"'~g' /usr/app/server-config.xml
sed -i 's~ADDITIONAL_ADDRESS1~'"$ADDITIONAL_ADDRESS1"'~g' /usr/app/server-config.xml
sed -i 's~ADDITIONAL_ADDRESS2~'"$ADDITIONAL_ADDRESS2"'~g' /usr/app/server-config.xml
sed -i 's~ADDITIONAL_ADDRESS3~'"$ADDITIONAL_ADDRESS3"'~g' /usr/app/server-config.xml
sed -i 's~ADDITIONAL_ADDRESS4~'"$ADDITIONAL_ADDRESS4"'~g' /usr/app/server-config.xml
sed -i 's~ADDITIONAL_ADDRESS5~'"$ADDITIONAL_ADDRESS5"'~g' /usr/app/server-config.xml
echo "Configuration set!"

# Run the standard container command.
echo "Init done. Run Calimero..."
exec "$@"