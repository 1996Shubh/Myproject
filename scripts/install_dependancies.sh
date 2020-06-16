#!/bin/bash
sudo apt-get update
sudo apt-get install python3-pip python3-dev nginx git -y
sudo apt-get update
pip3 install virtualenv
cd /home/ubuntu/Chatapp_project/Chatapplication
virtualenv --python=python3 venv
source /home/ubuntu/Chatapp_project/Chatapplication/venv/bin/activate
cd /home/ubuntu/Chatapp_project/Chatapplication/chatapp
pip3 install -r requirements.txt
pip3 install django bcrypt django-extensions
sudo chown ubuntu:ubuntu /home/ubuntu/Chatapp_project/Chatapplication/chatapp
cd /home/ubuntu/Chatapp_project/Chatapplication/chatapp/
python3 manage.py collectstatic --noinput

