#!/bin/bash
sudo yum -y install httpd
sudo systemctl httpd
sudo systemctl enable httpd
