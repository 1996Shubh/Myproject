sudo rm -rf /home/ubuntu/*
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
sudo cp /home/ubuntu/Chatapp_project/nginx/gunicorn.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn
sudo unlink /etc/nginx/sites-enabled/*
sudo cp /home/ubuntu/Chatapp_project/nginx/fundoo /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/fundoo /etc/nginx/sites-enabled
sudo nginx -t
sudo rm /etc/nginx/sites-enabled/default
sudo service nginx restart
sudo service gunicorn restart
sudo service nginx restart
