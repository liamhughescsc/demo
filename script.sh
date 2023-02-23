#!/bin/bash

if [[ -z "$1" ]]
then
   echo "Please pass the personal access token for GitLab"
   echo "Example: ./script.sh glpat-asdasdasdasdsad"
   exit 1
fi

# Install Homebrew
which -s brew
if [[ $? != 0 ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 
    (echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> /Users/user/.zprofile
    eval "$(/usr/local/bin/brew shellenv)"
fi

# Install Python
brew install pyenv
pyenv install -s 3.9.13
echo 'export PYENV_ROOT=$HOME/.pyenv' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
source ~/.zshrc

# Install AWS CLI
brew install awscli

# Install Tools
brew install yq jq make

# Install Docker
brew install docker --cask
open -a Docker

# Install Git
brew install git

# Install CDK
brew install aws-cdk

# Install Session Manager
curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/mac/sessionmanager-bundle.zip" -o "sessionmanager-bundle.zip"
unzip sessionmanager-bundle.zip
sudo ./sessionmanager-bundle/install -i /usr/local/sessionmanagerplugin -b /usr/local/bin/session-manager-plugin

curl --header "PRIVATE-TOKEN: $1" https://gitlab.aws.dev/api/v4/projects/26145/repository/archive.zip --output archive.zip
unzip archive.zip
mkdir DetC
mv detonation-chamber-main-*/* DetC/

cd DetC
pyenv local 3.9.13
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
