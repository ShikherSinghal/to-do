FROM python:3.7
RUN apt-get update
RUN apt-get install -y supervisor

WORKDIR /app
RUN mkdir media
RUN pip install pipenv
COPY Pipfile ./
COPY Pipfile.lock ./
RUN pipenv install
COPY . .
COPY config/supervisord.conf /etc/supervisor/conf.d/todo.conf
#Copy logrotate nginx configuration
# COPY config/logrotate/* /etc/logrotate.d/
RUN chmod +x entrypoint.sh


WORKDIR /app
ARG tag=unknown
ENV TODOAPP_VERSION ${tag}

# not running makemigrations, that should be done during development time only
ENTRYPOINT ["./entrypoint.sh"]
