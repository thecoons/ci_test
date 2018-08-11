 FROM python:3
 ENV PYTHONUNBUFFERED 1
 RUN mkdir /code
 WORKDIR /code
 ADD Pipfile /code/
 ADD Pipfile.lock /code/
 RUN pip install pipenv
 RUN pipenv install --deploy --system
 ADD . /code/
 CMD gunicorn project.wsgi