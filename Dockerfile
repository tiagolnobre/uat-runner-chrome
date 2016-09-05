FROM saksmlz/docker-capybara-webkit-chromedriver:2.2

RUN mkdir -p /specs
WORKDIR /specs

COPY Gemfile Gemfile.lock ./
RUN gem install bundler \
  && bundle update --jobs 20 --retry 5

CMD ["rspec"]
