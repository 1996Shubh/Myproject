#!/bin/bash

sudo unlink /etc/nginx/sites-enabled/*
sudo cp /home/ubuntu/Chatapp_project/nginx/fundoo /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/fundoo /etc/nginx/sites-enabled
sudo nginx -t
sudo rm /etc/nginx/sites-enabled/default
sudo service nginx restart



