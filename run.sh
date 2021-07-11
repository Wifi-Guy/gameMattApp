yum install dnf -y
dnf install python3 augeas-libs -y
python3 -m venv /opt/certbot/
/opt/certbot/bin/pip install --upgrade pip
/opt/certbot/bin/pip install certbot
ln -s /opt/certbot/bin/certbot /usr/bin/certbot
certbot certonly -d example.com --debug-challenges --standalone --dry-run
certbot certonly --standalone -d games.mattsmith.app -m 08msmith6@gmail.com --agree-tos -n --preferred-challenges tls-sni
echo "0 0,12 * * * root /opt/certbot/bin/python -c 'import random; import time; time.sleep(random.random() * 3600)' && certbot renew -q" | tee -a /etc/crontab > /dev/null

python manage.py migrate
python manage.py createsuperuser --no-input --email example@mattsmith.app
python manage.py runserver 0.0.0.0:8000

