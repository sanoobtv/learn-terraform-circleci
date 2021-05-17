#!/bin/bash
sudo apt-get -y install nginx
sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl start nginx