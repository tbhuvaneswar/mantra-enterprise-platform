#!/bin/bash
set -e

sudo yum update -y
sudo yum install -y git jq htop

# Optional monitoring
sudo yum install -y amazon-cloudwatch-agent

# Enable services if needed
sudo systemctl enable docker || true
