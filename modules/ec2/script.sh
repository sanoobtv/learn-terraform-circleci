#!/bin/bash
sudo apt update
sudo apt-get -y install httpd
sudo systemctl httpd && sudo systemctl enable httpd
