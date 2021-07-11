FROM centos/python-38-centos7:latest
USER root
COPY requirements.txt /tmp
WORKDIR /apps/games.mattsmith.app
RUN pip install -r /tmp/requirements.txt
ENV DJANGO_SUPERUSER_PASSWORD=root
ENV DJANGO_SUPERUSER_USERNAME=root
COPY games.mattsmith.app /apps/games.mattsmith.app
RUN chmod -R 777 /apps/games.mattsmith.app
WORKDIR /apps/games.mattsmith.app
VOLUME /apps/games.mattsmith.app/persistent/
COPY run.sh /apps/games.mattsmith.app

EXPOSE 8000

ENTRYPOINT ["sh", "/apps/games.mattsmith.app/run.sh"]