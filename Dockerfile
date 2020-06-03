FROM jekyll/jekyll:4

# WORKDIR /tmp

WORKDIR /srv/jekyll

#####################
# Install node
# node version 12.14.0
#####################
RUN apt-get update
RUN wget https://nodejs.org/dist/v12.14.0/node-v12.14.0.tar.gz && \
    tar -xzvf node-v12.14.0.tar.gz && \
    rm node-v12.14.0.tar.gz && \
    cd node-v12.14.0 && \
    ./configure && \
    make -j4 && \
    make install && \
    cd .. && \
    rm -r node-v12.14.0

#####################
# Install firebase
#####################
RUN npm install firebase-tools@7.10.0 --unsafe-perm --verbose


#####################
# Install gems/jekyll
#####################
# add your volume's Gemfile(.lock) to tmp
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN bundle install --verbose # --path vendor/bundle
RUN gem install eventmachine --platform ruby


ENTRYPOINT bundle exec jekyll build &&\
           bundle exec jekyll serve -wIl \
                            --host 0.0.0.0
