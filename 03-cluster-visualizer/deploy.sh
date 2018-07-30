#!/bin/sh
docker network create -d overlay traefi-net && docker stack deploy -c base.yml cluster-visualizer