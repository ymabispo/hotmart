#!/bin/sh
docker network create -d overlay traefik-net && docker stack deploy -c base.yml infra-stack