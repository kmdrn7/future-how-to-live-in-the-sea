#!/bin/bash

docker network create --driver=overlay traefik-public
docker network create --driver=overlay private
