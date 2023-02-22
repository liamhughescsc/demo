#!/bin/bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 

# Install AWS CLI
curl “https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /

# Install Tools
sudo yum install yq jq make

# Install Docker
curl https://desktop.docker.com/mac/main/amd64/Docker.dmg
hdiutil mount Docker.dmg
sudo cp -R "/Volumes/Docker/Docker.app" /Applications

# Install Python
curl https://www.python.org/ftp/python/3.9.13/python-3.9.13-macosx10.9.pkg
sudo installer -pkg python-3.9.13-macosx10.9.pkg -target /

# Install Git
brew install git

# Install Session Manager
curl “https://s3.amazonaws.com/session-manager-downloads/plugin/latest/mac/sessionmanager-bundle.zip" -o "sessionmanager-bundle.zip"
unzip sessionmanager-bundle.zip
sudo ./sessionmanager-bundle/install -i /usr/local/sessionmanagerplugin -b /usr/local/bin/session-manager-plugin

