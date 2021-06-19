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
CMD ["pipenv","run","python","manage.py","collectstatic","--noinput"]

CMD ["pipenv","run","python", "manage.py", "migrate",]

WORKDIR /app
CMD ["pipenv","run","python", "manage.py", "runserver", "0:8000"]
