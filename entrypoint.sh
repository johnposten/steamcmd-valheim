#!/bin/bash
bash "${STEAMCMDDIR}/steamcmd.sh" +login anonymous \
				+force_install_dir "${STEAMAPPDIR}" \
				+app_update "${STEAMAPPID}" validate \
				+quit

# Change rcon port on first launch, because the default config overwrites the commandline parameter (you can comment this out if it has done it's purpose)
#sed -i -e 's/name \"My server\"'"name \"${SERVER_NAME}\""'/g' "${STEAMAPPDIR}/start_server.sh"

bash "${STEAMAPPDIR}/start_server.sh"