# Working with Docker

##

```bash

docker compose up -d

#
docker compose --profile backend up -d

#
docker compose --profile backend up -d --scale api=3

# build the image
docker build --target demo -t springboot-task-tracker-postgres-docker:v1 .

# tag the image for docker hub
docker tag springboot-task-tracker-postgres-docker:v1 rmontesleo/springboot-task-tracker-postgres-docker:v1


docker compose --profile repository up -d


docker push rmontesleo/springboot-task-tracker-postgres-docker:v1

```