---
abstract: Dockerfile and other configuration required to build the monero image.
authors:
    - name: Xander Harris
      email: xandertheharris@gamil.com
date: 2024-08-04
title: Docker Information
---

For the build command shown below to work, you'll need to make sure that
your version of {term}`Docker` includes the `buildx` plugin.

## Build Container Image

Ethereum requires two types of nodes to run, so there will be two images
to be built.

### Execution Node Image Build

```{code-block} shell
:caption: container image build

GHCR_EXECUTION_REPO=ghcr.io/username/helm-ethereum-node/execution
DOCKER_EXECUTION_REPO=username/ethereum-execution-node
VERSION="0.0.1"

docker build \
  --build-arg VERSION="${VERSION}" -t "${GHCR_EXECUTION_REPO}:${VERSION}" \
  -t "${DOCKER_EXECUTION_REPO}:${VERSION}" --push -f docker/Dockerfile \
  --target execution .
```

### Consensus Node Image Build

```{note}
This image requires that several systemd services be running and that means
we'll need to provide this container with some additional privileges.
[This ServerFault answer](https://serverfault.com/a/653997/1078068) provides
some context.
```

```{code-block} shell
:caption: consensus node image build

GHCR_CONSENSUS_REPO=ghcr.io/username/helm-ethereum-node/consensus
DOCKER_CONSENSUS_REPO=username/ethereum-consensus-node
VERSION="0.0.1"

docker build \
  --build-arg VERSION="${VERSION}" -t "${GHCR_CONSENSUS_REPO}:${VERSION}" \
  -t "${DOCKER_CONSENSUS_REPO}:${VERSION}" --push -f docker/Dockerfile \
  --target consensus .
```

### Dockerfile Contents

```{literalinclude} /docker/Dockerfile
:caption: docker/Dockerfile
:language: docker
```
