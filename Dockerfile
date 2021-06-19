FROM python:3.7
RUN apt-get update
# RUN apt-get install -y supervisor

WORKDIR /app
RUN mkdir media
RUN pip install pipenv
COPY Pipfile ./
COPY Pipfile.lock ./
RUN pipenv install

CMD ["pipenv","run","python","manage.py","collectstatic","--noinput"]
# RUN pipenv run python manage.py migrate
CMD ["pipenv","run","python", "manage.py", "migrate",]

COPY . .
# COPY config/supervisord.conf /etc/supervisor/conf.d/todo.conf
#Copy logrotate nginx configuration
# COPY config/logrotate/* /etc/logrotate.d/
# RUN chmod +x entrypoint.sh


WORKDIR /app
CMD ["pipenv","run","python", "manage.py", "runserver", "8000"]
