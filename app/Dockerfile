FROM python:3

LABEL maintainer="Albert Thalidzhokov <thalidzhokov@gmail.com>"

ENV PYTHONUNBUFFERED 1
RUN mkdir /docker_app
WORKDIR /docker_app
COPY . /docker_app
RUN pip install -r requirements.txt
# RUN pip install  -i  https://pypi.python.org/simple/  -r requirements.txt

RUN python manage.py collectstatic

# Spacy
# Fasttext vectors https://fasttext.cc/docs/en/crawl-vectors.html
RUN mkdir -p /fasttext-vectors/word-vectors-v2
RUN wget https://s3-us-west-1.amazonaws.com/fasttext-vectors/word-vectors-v2/cc.ru.300.vec.gz -O /tmp/cc.ru.300.vec.gz
RUN python -m spacy init-model ru /fasttext-vectors/word-vectors-v2 --vectors-loc /tmp/cc.ru.300.vec.gz

EXPOSE 3031