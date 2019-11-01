FROM ruby:2.6.4
RUN apt-get update -qq && apt-get install -y postgresql-client 
RUN mkdir /espertofit
WORKDIR /espertofit
COPY Gemfile /espertofit/Gemfile
COPY Gemfile.lock /espertofit/Gemfile.lock
RUN bundle install
RUN rails db:setup
COPY . /espertofit

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
#ENTRYPOINT ["entrypoint.sh"]
EXPOSE 6000

# Start the main process.

CMD ["rails", "server", "-b", "0.0.0.0"]
