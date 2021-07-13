export DJANGO_SECRET_KEY='local'
export ENVIRONMENT='dev'
export CERTS=false
cd games.mattsmith.app || echo 'cant find dir'
python manage.py migrate
python manage.py runserver 127.0.0.1:8001

pause
