#!/bin/bash
sudo yum -y install httpd
sudo yum -y install telnet
sudo systemctl start httpd
sudo systemctl enable httpd