
if [[ ! -f /etc/letsencrypt/live/games.mattsmith.app/fullchain.pem ]] || [[ ! -f /etc/letsencrypt/live/games.mattsmith.app/privkey.pem ]]
then
  sh certs.sh
fi

yum install epel-release -y
yum install nginx -y

nginx

python manage.py migrate
python manage.py createsuperuser --no-input --email example@mattsmith.app
python manage.py runserver 127.0.0.1:8001

