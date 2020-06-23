sudo apt-get update
sudo apt-get install python3-pip python3-dev nginx git -y
sudo apt-get update
pip3 install virtualenv
script_dir=$(dirname "$0")
cd $script_dir/Chatapplication
virtualenv --python=python3 venv
source $script_dir/Chatapplication/venv/bin/activate
cd $script_dir/Chatapplication/chatapp
pip3 install -r requirements.txt
pip3 install django bcrypt django-extensions
sudo chown $USER:$USER $script_dir/Chatapplication/chatapp
cd $script_dir/Chatapplication/chatapp/
python3 manage.py collectstatic --noinput
sudo cp $script_dir/nginx/gunicorn.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn
sudo unlink /etc/nginx/sites-enabled/*
sudo cp $script_dir/nginx/fundoo /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/fundoo /etc/nginx/sites-enabled
sudo nginx -t
sudo rm /etc/nginx/sites-enabled/default
sudo service nginx restart
sudo service gunicorn restart
sudo service nginx restart
