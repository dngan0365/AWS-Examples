#!/bin/bash

set -e

echo "Installing tree..."
sudo apt-get update && sudo apt-get install -y tree

echo "Installing AWS CDK..."
npm install -g aws-cdk

echo "Installing AWS CLI..."
cd /workspace
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip

echo "Setup completed!"
