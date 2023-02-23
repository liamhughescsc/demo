#!/bin/bash

if ! [[ -z "$1" ]]
then
   echo "Please pass the personal access token for GitLab"
   echo "Example: ./script.sh glpat-asdasdasdasdsad"
   exit 1
fi

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 
(echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> /Users/user/.zprofile
eval "$(/usr/local/bin/brew shellenv)"

# Install AWS CLI
brew install awscli

# Install Tools
brew install yq jq make

# Install Docker
brew install docker --cask
open -a Docker

# Install Python
brew install pyenv
pyenv install -s 3.9.13 

# Install Git
brew install git

# Install CDK
brew install aws-cdk

# Install Session Manager
curl “https://s3.amazonaws.com/session-manager-downloads/plugin/latest/mac/sessionmanager-bundle.zip" -o "sessionmanager-bundle.zip"
unzip sessionmanager-bundle.zip
sudo ./sessionmanager-bundle/install -i /usr/local/sessionmanagerplugin -b /usr/local/bin/session-manager-plugin

curl --header "PRIVATE-TOKEN: $1" https://gitlab.aws.dev/api/v4/projects/26145/repository/archive.zip --output archive.zip
unzip archive.zip -d DetC
cd DetC

python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
