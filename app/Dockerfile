FROM python:3

LABEL maintainer="Albert Thalidzhokov <thalidzhokov@gmail.com>"

ARG APP_SECRET_KEY
ENV APP_SECRET_KEY=${APP_SECRET_KEY}

ARG POSTGRES_HOST
ENV POSTGRES_HOST=${POSTGRES_HOST}

ARG POSTGRES_PORT
ENV POSTGRES_PORT=${POSTGRES_PORT}

ARG POSTGRES_DB
ENV POSTGRES_DB=${POSTGRES_DB}

ARG POSTGRES_USER
ENV POSTGRES_USER=${POSTGRES_USER}

ARG POSTGRES_PASSWORD
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}

ENV PYTHONUNBUFFERED 1

RUN mkdir /app
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
# RUN pip install  -i  https://pypi.python.org/simple/  -r requirements.txt

RUN python manage.py collectstatic
#RUN python manage.py makemigrations

# Spacy
# Fasttext vectors https://fasttext.cc/docs/en/crawl-vectors.html
RUN mkdir -p /fasttext-vectors/word-vectors-v2
RUN wget https://s3-us-west-1.amazonaws.com/fasttext-vectors/word-vectors-v2/cc.ru.300.vec.gz -O /tmp/cc.ru.300.vec.gz
RUN python -m spacy init-model ru /fasttext-vectors/word-vectors-v2 --vectors-loc /tmp/cc.ru.300.vec.gz

EXPOSE 3031