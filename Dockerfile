FROM python:3.7

WORKDIR /app
RUN pip install pipenv
COPY Pipfile ./
COPY Pipfile.lock ./
RUN pipenv install
COPY . .
