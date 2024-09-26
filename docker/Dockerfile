FROM archlinux:base-devel AS build-executor
ARG VERSION='0.0.1'
LABEL org.opencontainers.image.licenses="Unlicense"
LABEL org.opencontainers.image.source="https://github.com/edwardtheharris/helm-ethereum-node"
LABEL org.opencontainers.image.description="An Ethereum Execution Node running go-ethereum based on ArchLinux"
LABEL org.opencontainers.image.name="build-executor"
LABEL org.opencontainers.image.version=${VERSION}
RUN pacman -Syyu go-ethereum --noconfirm

FROM archlinux/archlinux:base-20240925.0.265508 AS executor
ARG VERSION='0.0.1'
LABEL org.opencontainers.image.licenses="Unlicense"
LABEL org.opencontainers.image.source="https://github.com/edwardtheharris/helm-ethereum-node"
LABEL org.opencontainers.image.description="An Ethereum Execution Node running go-ethereum based on ArchLinux"
LABEL org.opencontainers.image.name="executor"
LABEL org.opencontainers.image.version=${VERSION}
RUN mkdir -pv /srv/ethereum \
    && mkdir -pv /etc/ethereum
COPY --from=build-executor /usr/sbin/geth /usr/sbin/geth
COPY --from=build-executor /usr/sbin/clef /usr/sbin/clef
COPY docker/entrypoint.sh /bin/entrypoint.sh
COPY docker/ethereum.conf /etc/ethereum/ethereum.conf
RUN chmod +x /bin/entrypoint.sh
EXPOSE 8545
EXPOSE 8551
EXPOSE 8546
EXPOSE 30303
VOLUME /srv/ethereum
WORKDIR /srv/ethereum
CMD ["/bin/entrypoint.sh"]

FROM archlinux/archlinux:base-20240925.0.265508 AS clef
ARG VERSION='0.0.1'
LABEL org.opencontainers.image.licenses="Unlicense"
LABEL org.opencontainers.image.source="https://github.com/edwardtheharris/helm-ethereum-node"
LABEL org.opencontainers.image.description="An image for running Clef"
LABEL org.opencontainers.image.name="clef"
LABEL org.opencontainers.image.version=${VERSION}
RUN mkdir -pv /srv/ethereum
VOLUME /srv/ethereum
EXPOSE 8550
COPY --from=build-executor /usr/sbin/clef /usr/sbin/clef
COPY docker/clef/entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh
CMD ["/bin/entrypoint.sh"]

FROM archlinux:base-devel AS consensus
ARG VERSION='0.0.1'
LABEL org.opencontainers.image.licenses="Unlicense"
LABEL org.opencontainers.image.source="https://github.com/edwardtheharris/helm-ethereum-node"
LABEL org.opencontainers.image.description="An Ethereum Consensus Node running Prysm based on ArchLinux"
LABEL org.opencontainers.image.name="ethereum-consensus-node"
LABEL org.opencontainers.image.version=${VERSION}
VOLUME /srv/ethereum
ENV USE_PRYSM_VERSION=v5.0.0
RUN curl https://raw.githubusercontent.com/prysmaticlabs/prysm/master/prysm.sh --output /usr/sbin/prysm.sh \
    && chmod +x /usr/sbin/prysm.sh \
    && mkdir -pv /srv/ethereum/consensus \
    && /usr/sbin/prysm.sh beacon-chain --accept-terms-of-use --datadir=/srv/ethereum/consensus generate-auth-secret \
    && rm -v /jwt.hex
COPY docker/consensus/entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh
EXPOSE 4000
CMD ["/bin/entrypoint.sh"]
