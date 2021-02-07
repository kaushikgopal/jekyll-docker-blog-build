Available on docker-hub https://hub.docker.com/repository/docker/jklgg/blog-build

# Using this container for your jekyll blog

Run this locally (from your jekyll directory) like so:

    # Run jekyll server with live-reload
    docker-compose up
    # docker run --rm --publish 4000:4000 --publish 35729:35729 -v="$PWD:/srv/jekyll" -it jklgg/jblog:1.0


To publish with firebase hosting

    # jekyll build and then firebase deploy
    docker-compose -f docker-compose-publish.yml up
    # docker run --rm -v="$PWD:/srv/jekyll" -it jklgg/jblog:1.0 /usr/local/bin/firebase deploy

# Adapted from:

* https://github.com/docker-library/ruby/blob/a564feaaee4c8647c299ab11d41498468bb9af7b/2.7/alpine3.11/Dockerfile
* https://github.com/nodejs/docker-node/blob/master/12/alpine3.11/Dockerfile
* https://github.com/envygeeks/jekyll-docker/blob/master/repos/jekyll/Dockerfile
* https://kaush.quip.com/ccxYAW933asG/Docker-Jekyll


# Upgrading dependencies

* Update the Gemfile
* bundle install
* docker build --tag jklgg/jblog:X.X --file Dockerfile .
