#!/bin/bash


sed -i 's/focal/jammy/g' /etc/apt/sources.list
sed -i 's/focal/jammy/g' /etc/apt/sources.list.d/*.list
apt update
DEBIAN_FRONTEND=noninteractive apt -yq upgrade
DEBIAN_FRONTEND=noninteractive apt -yq dist-upgrade
