if [  "$CERTS" = true ]; then
  yum install dnf -y
  dnf install python3 augeas-libs -y
  python3 -m venv /opt/certbot/
  /opt/certbot/bin/pip install --upgrade pip
  /opt/certbot/bin/pip install certbot
  ln -s /opt/certbot/bin/certbot /usr/bin/certbot
  certbot certonly --standalone -d games.mattsmith.app -m 08msmith6@gmail.com --agree-tos -n --http-01-port 8000 --http-01-address 0.0.0.0 --cert-path /apps/games/games.cert --key-path /apps/games/games.key
  echo "0 0,12 * * * root /opt/certbot/bin/python -c 'import random; import time; time.sleep(random.random() * 3600)' && certbot renew -q" | tee -a /etc/crontab > /dev/null
fi