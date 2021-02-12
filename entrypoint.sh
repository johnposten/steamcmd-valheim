#!/bin/bash
bash "${STEAMCMDDIR}/steamcmd.sh" +login anonymous \
				+force_install_dir "${STEAMAPPDIR}" \
				+app_update "${STEAMAPPID}" \
				+quit

cd "${STEAMAPPDIR}"

# Change server name, password and world
sed -i -e 's/name \"My server\"/'"name \"${SERVER_NAME}\""'/g' "start_server.sh" && sed -i -e 's/password \"secret\"/'"password \"${SERVER_PASSWORD}\""'/g' "start_server.sh" && sed -i -e 's/world \"Dedicated\"/'"world \"${WORLD}\""'/g' "start_server.sh"

echo "Starting server..."

bash "${STEAMAPPDIR}/start_server.sh"