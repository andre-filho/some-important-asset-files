#!/bin/bash

configure-git(){
  # install git if isn't already
  echo "check installation of git..."
  if ! git --help;
  then
    username=''
    email=''
    echo "updating system's packages"
    if ! apt-get update;
    then
      echo "failed to update packages..."
      echo "continuing install..."
    fi
    echo "installing git..."
    apt-get install git
    echo "digite nome de usuario no git:"
    read username
    echo "digite email de usuario no git:"
    read email
    git config --global user.name $username
    git config --global user.email $email
  fi

  # install vim if isn't already
  echo "check installation of vim editor..."
  if ! vim --help;
  then
    echo "updating system's packages"
    if ! apt-get update;
    then
      echo "failed to update packages..."
      echo "continuing install..."
    fi
    apt-get install vim
  fi

  # downloads git repo that has commit template
  git clone http://github.com/andre-filho/some-important-asset-files $HOME/git-assets
  cat $HOME/git-assets/.gitmessage-angular > $HOME/.gitmsg

  # non default git configurations
  git config --global commit.template $HOME/.gitmsg
  git config --global core.editor vim
}

configure-git
