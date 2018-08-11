#!/bin/sh
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG='latest'
    echo '### Heroku registry connection'
    echo "$HEROKU_TOKEN_AUTH" | docker login --username=$ADMIN_MAIL --password-stdin registry.heroku.com
    echo '### Tag previous'
    docker tag $TRAVIS_REPO_SLUG:$TAG registry.heroku.com/$HEROKU_PROJECT_NAME/web
    echo '### Push image into the registry'
    docker push registry.heroku.com/$HEROKU_PROJECT_NAME/web
    echo '### Logout registry'
    docker logout registry.heroku.com
else
    echo '### We only put in production the `master` branch ...'
fi