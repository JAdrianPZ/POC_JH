# Dockerfile.rails
FROM ruby:3.3 AS rails-toolbox

# Default directory
#ENV INSTALL_PATH /opt/app
#RUN mkdir -p $INSTALL_PATH

# Install rails
RUN gem install rails bundler
RUN gem install rails passenger
#RUN chown -R user:user /opt/app
#WORKDIR /opt/app

WORKDIR /usr/src/app/

COPY Gemfile Gemfile.lock ./
RUN bundle update sinatra
RUN bundle install


ADD . /usr/src/app/


EXPOSE 3333
# Run a shell
#CMD ["/bin/sh"]
CMD ["ruby", "/usr/src/app/helloworld.rb"]