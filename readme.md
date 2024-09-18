---
abstract: A Helm Chart for deploying Ethereum nodes.
authors:
  - name: Xander Harris
    email: xandertheharris@gmail.com
date: 2024-08-17
title: Readme
---

[![CodeQL](https://github.com/edwardtheharris/helm-ethereum-node/actions/workflows/codeql.yml/badge.svg)](https://github.com/edwardtheharris/helm-ethereum-node/actions/workflows/codeql.yml)
[![Dependabot Updates](https://github.com/edwardtheharris/helm-ethereum-node/actions/workflows/dependabot/dependabot-updates/badge.svg)](https://github.com/edwardtheharris/helm-ethereum-node/actions/workflows/dependabot/dependabot-updates)
[![Documentation](https://github.com/edwardtheharris/helm-ethereum-node/actions/workflows/documentation.yml/badge.svg)](https://github.com/edwardtheharris/helm-ethereum-node/actions/workflows/documentation.yml)
[![OSSAR](https://github.com/edwardtheharris/helm-ethereum-node/actions/workflows/ossar.yml/badge.svg)](https://github.com/edwardtheharris/helm-ethereum-node/actions/workflows/ossar.yml)
[![Test Helm Chart](https://github.com/edwardtheharris/helm-ethereum-node/actions/workflows/helm.yml/badge.svg)](https://github.com/edwardtheharris/helm-ethereum-node/actions/workflows/helm.yml)
[![wakatime](https://wakatime.com/badge/github/edwardtheharris/helm-ethereum-node.svg)](https://wakatime.com/badge/github/edwardtheharris/helm-ethereum-node)

## Usage

1. Create a namespace.

   ```shell
   kubectl create ns ethereum
   ```

2. Configure your values.
3. Deploy the resources.

   ```shell
   helm -n ethereum upgrade --install ethereum . -f values.yaml
   ```
