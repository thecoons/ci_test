#!/bin/sh
echo '### Heroku registry connection'
echo "$DOCKER_PASSWORD" | docker login --username=$DOCKER_USER --password-stdin
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
echo '### repo:tag ==> '$TRAVIS_REPO_SLUG:$TAG
echo '### Build image'
docker build -f Dockerfile -t $TRAVIS_REPO_SLUG:$TAG .
echo '### Push image to DockerHub'
docker push $TRAVIS_REPO_SLUG
echo '### Logout registry'
docker logout