#!/bin/bash

EMAIL=$1

echo $EMAIL
echo "Installing xclip ... "
sudo apt-get install -y xclip

ssh-keygen -t rsa -b 4096 -C "$EMAIL"
eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_rsa

xclip -sel clip < ~/.ssh/id_rsa.pub


