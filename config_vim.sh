#!/bin/bash

echo "fetching repo"
git clone https://gitlab.com/lappis-unb/tools/vim/lappis_vimrc.git $HOME/lappis_vimrc

chmod 777 $HOME/lappis_vimrc/install.sh

./$HOME/lappis_vimrc/install.sh
