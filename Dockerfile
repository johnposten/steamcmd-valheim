############################################################
# Dockerfile that builds a Valheim Dedicated server
############################################################
FROM cm2network/steamcmd:root

LABEL maintainer="johnposten@gmail.com"

ENV STEAMAPPID 896660
ENV STEAMAPP valheim
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}-dedicated"
#ENV DLURL https://raw.githubusercontent.com/johnposten/steamcmd-valheim
ENV PORTRANGE "2456-2458/udp"
ENV SERVER_NAME "Valheim Dedicated"
ENV WORLD "something"
ENV SERVER_PASSWORD "changeme"

COPY [ "entrypoint.sh", "${HOMEDIR}/entrypoint.sh" ]

RUN set -x \
	#&& apt-get update \
	#&& apt-get install -y --no-install-recommends --no-install-suggests \
	#	wget=1.20.1-1.1 \
	#&& wget "${DLURL}/main/entrypoint.sh" -O "${HOMEDIR}/entrypoint.sh" \
	&& mkdir -p "${STEAMAPPDIR}" \
	&& chmod 755 "${HOMEDIR}/entrypoint.sh" "${STEAMAPPDIR}" \
	&& chown "${USER}:${USER}" "${HOMEDIR}/entrypoint.sh" "${STEAMAPPDIR}" \
	&& rm -rf /var/lib/apt/lists/*

USER ${USER}

WORKDIR ${HOMEDIR}

CMD ["bash", "entrypoint.sh"]

# Expose ports
EXPOSE ${PORTRANGE}