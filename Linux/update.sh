#!/bin/bash

#Ensure apt has all available updates
apt update -y

# Upgrade all installled packages
apt upgrade -y

# Intall new packages and uninstall any old packages that must be removed
apt full-upgrade -y

apt autoremove --purge -y

apt update -y && apt upgrade -y && apt full-upgrade -y && apt-get autoremove --purge -y

