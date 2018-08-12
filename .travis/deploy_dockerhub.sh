#!/bin/sh
echo '### Heroku registry connection'
echo "$DOCKER_PASSWORD" | docker login --username=$DOCKER_USER --password-stdin
echo '### Latest Tag : Repository:LatestTag ==> '$TRAVIS_REPO_SLUG:latest
echo '### Build image'
docker build -f Dockerfile -t $TRAVIS_REPO_SLUG:latest .
echo '### Push image to DockerHub'
docker push $TRAVIS_REPO_SLUG
echo '###Release Repository:PullRequestNumber ===> '$TRAVIS_REPO_SLUG:$TRAVIS_COMMIT
docker tag $TRAVIS_REPO_SLUG:latest $TRAVIS_REPO_SLUG:$TRAVIS_COMMIT
echo '### Push release image to DockerHub'
docker push $TRAVIS_REPO_SLUG:$TRAVIS_COMMIT
echo '### Logout registry'
docker logout