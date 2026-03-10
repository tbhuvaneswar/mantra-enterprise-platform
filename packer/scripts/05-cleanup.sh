#!/bin/bash
set -e

echo "Cleaning system..."

sudo yum autoremove -y
sudo yum clean all

# Remove temporary files
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*

echo "Cleanup completed"
