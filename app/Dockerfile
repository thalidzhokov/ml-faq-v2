FROM python:3

LABEL maintainer="Albert Thalidzhokov <thalidzhokov@gmail.com>"

ARG APP_SECRET_KEY
ENV APP_SECRET_KEY=${APP_SECRET_KEY}

ARG APP_USER
ENV APP_USER=${APP_USER}

ARG APP_USER_EMAIL
ENV APP_USER_EMAIL=${APP_USER_EMAIL}

ARG APP_USER_PASSWORD
ENV APP_USER_PASSWORD=${APP_USER_PASSWORD}

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


# Install requirements
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
# RUN pip install  -i  https://pypi.python.org/simple/  -r requirements.txt


# Spacy
# Fasttext vectors https://fasttext.cc/docs/en/crawl-vectors.html
#RUN if [ ! -f "uploads/cc.ru.300.vec.gz" ]; then wget https://s3-us-west-1.amazonaws.com/fasttext-vectors/word-vectors-v2/cc.ru.300.vec.gz -O uploads/cc.ru.300.vec.gz; fi

# Inint model
#RUN mkdir -p /tmp/fasttext-vectors/word-vectors-v2
#RUN python -m spacy init-model ru /tmp/fasttext-vectors/word-vectors-v2 --vectors-loc uploads/cc.ru.300.vec
RUN python -c 'import nltk; nltk.download("stopwords"); nltk.download("punkt")'


# Entrypoint
RUN chmod +x entrypoint.sh
CMD ["/bin/bash", "entrypoint.sh"]

EXPOSE 3031