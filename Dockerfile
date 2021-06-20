FROM python:3.7
RUN apt-get update
# RUN apt-get install -y supervisor

WORKDIR /app
RUN mkdir media
RUN pip install pipenv
COPY Pipfile ./
COPY Pipfile.lock ./
RUN pipenv install
COPY . .
