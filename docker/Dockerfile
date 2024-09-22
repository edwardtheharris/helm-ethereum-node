FROM archlinux:base-devel
ARG VERSION='0.0.1'
LABEL org.opencontainers.image.licenses="Unlicense"
LABEL org.opencontainers.image.source="https://github.com/edwardtheharris/helm-ethereum-node"
LABEL org.opencontainers.image.description="An Ethereum Node running in ArchLinux"
LABEL org.opencontainers.image.name="ethereum"
LABEL org.opencontainers.image.version=${VERSION}
RUN pacman -Syyu go-ethereum --noconfirm && mkdir -pv /srv/ethereum \
    && mkdir -pv /etc/ethereum && mkdir -pv /root/.ethereum/keystore
COPY docker/entrypoint.sh /bin/entrypoint.sh
COPY docker/ethereum.conf /etc/ethereum/ethereum.conf
RUN chmod +x /bin/entrypoint.sh
EXPOSE 8545
EXPOSE 8551
EXPOSE 8546
EXPOSE 30303
CMD ["/bin/entrypoint.sh"]
