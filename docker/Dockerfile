FROM archlinux:base-devel AS execution
ARG VERSION='0.0.1'
LABEL org.opencontainers.image.licenses="Unlicense"
LABEL org.opencontainers.image.source="https://github.com/edwardtheharris/helm-ethereum-node"
LABEL org.opencontainers.image.description="An Ethereum Execution Node running go-ethereum based on ArchLinux"
LABEL org.opencontainers.image.name="ethereum-execution"
LABEL org.opencontainers.image.version=${VERSION}
RUN pacman -Syyu go-ethereum --noconfirm && mkdir -pv /srv/ethereum \
    && mkdir -pv /etc/ethereum
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

FROM archlinux:base-devel AS consensus
ARG VERSION='0.0.1'
LABEL org.opencontainers.image.licenses="Unlicense"
LABEL org.opencontainers.image.source="https://github.com/edwardtheharris/helm-ethereum-node"
LABEL org.opencontainers.image.description="An Ethereum Consensus Node running Prysm based on ArchLinux"
LABEL org.opencontainers.image.name="ethereum-consensus"
LABEL org.opencontainers.image.version=${VERSION}
RUN pacman --noconfirm -Syyu systemd
COPY docker/consensus/prysm-beacon-chain-5.1.0-x86_64 /usr/bin/prysm-beacon-chain
RUN chmod +x /usr/bin/prysm-beacon-chain
COPY docker/consensus/entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh
CMD ["/bin/entrypoint.sh"]
