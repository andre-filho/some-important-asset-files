#!/bin/bash
configure-git(){
  if [ $1='help' ];
  then
    echo "usage: 'name' email"
  else
    echo "check installation of git..."
    if ! command -v git;
    then
      echo "updating system's packages"
      if ! apt-get update;
      then
        echo "failed to update packages..."
        echo "continuing install..."
      fi
      echo "installing git..."
      apt-get install git
      git config --global user.name $1
      git config --global user.email $2
    fi
    echo "check installation of vim editor..."
    if ! command -v vim;
    then
      echo "updating system's packages"
      if ! apt-get update;
      then
        echo "failed to update packages..."
        echo "continuing install..."
      fi
      apt-get install vim
    fi
    if ! command -v commit;
    then
      if command -v pip3;
      then
        apt install -y python3 python3-pip
        pip3 install pyyaml
      fi
      git clone https://github.com/andre-filho/commit-helper.git ~/.commit-helper
      echo "commit(){ python3 ~/.commit-helper/generator.py; }" >> ~/.bashrc
      source ~/.bashrc
      echo "commit helper was installed successfully!"
    fi
    git config --global core.editor vim
  fi
}

configure-git $1 $2
