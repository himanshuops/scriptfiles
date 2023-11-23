#!/bin/bash

# Update package lists and upgrade existing packages
sudo apt update
sudo apt upgrade -y

# Install necessary packages (curl, software-properties-common)
sudo apt install -y curl software-properties-common

# Add Grafana repository and install Grafana
curl https://packages.grafana.com/gpg.key | sudo apt-key add -
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
sudo apt update
sudo apt install -y grafana

# Add Loki repository and install Loki
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
sudo add-apt-repository "deb https://packages.grafana.com/loki/deb stable main"
sudo apt update
sudo apt install -y loki

# Start Loki and Grafana services
sudo systemctl start loki
sudo systemctl enable loki
sudo systemctl start grafana-server
sudo systemctl enable grafana-server

