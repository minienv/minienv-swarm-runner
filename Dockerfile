FROM minienv/minienv-proxy:latest

RUN mkdir /dc

COPY requirements.txt \
     docker-compose.yml /dc/

WORKDIR /dc

RUN apk add --no-cache bash \
    python \
  && python -m ensurepip \
  && pip install --upgrade pip \
  && pip install -r requirements.txt

COPY minienv-swarm-runner-entrypoint.sh /

ENTRYPOINT ["/minienv-swarm-runner-entrypoint.sh"]