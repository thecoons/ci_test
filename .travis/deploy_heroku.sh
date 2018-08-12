#!/bin/sh

echo '### Heroku registry connection'
echo "$HEROKU_TOKEN_AUTH" | docker login --username=$ADMIN_MAIL --password-stdin registry.heroku.com
echo '### Tag for Staging'
docker tag $TRAVIS_REPO_SLUG:latest registry.heroku.com/$HEROKU_PROJECT_STAGING_NAME/web
echo '### Push image into the staging registry'
docker push registry.heroku.com/$HEROKU_PROJECT_STAGING_NAME/web
echo '### Tag for production'
docker tag $TRAVIS_REPO_SLUG:latest registry.heroku.com/$HEROKU_PROJECT_NAME/web
echo '### Push image into the production registry'
docker push registry.heroku.com/$HEROKU_PROJECT_NAME/web
echo '### Logout registry'
docker logout registry.heroku.com
