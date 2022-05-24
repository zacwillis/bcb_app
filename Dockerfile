FROM ruby:3.1.2-slim-bullseye AS assets

WORKDIR /app

RUN bash -c "set -o pipefail && apt-get update \
  && apt-get install -y --no-install-recommends build-essential curl git libpq-dev \
  && curl -sSL https://deb.nodesource.com/setup_16.x | bash - \
  && curl -sSL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo 'deb https://dl.yarnpkg.com/debian/ stable main' | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update && apt-get install -y --no-install-recommends nodejs yarn \
  && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man \
  && apt-get clean \
  && useradd --create-home appuser \
  && mkdir /node_modules && chown appuser:appuser -R /node_modules /app"

USER appuser

# install rails
RUN gem install rails --version 7.0.3

COPY --chown=appuser:appuser Gemfile* ./
RUN bundle install --jobs "$(nproc)"

COPY --chown=appuser:appuser package.json *yarn* ./
RUN yarn install

ARG RAILS_ENV="production"
ARG NODE_ENV="production"
ENV RAILS_ENV="${RAILS_ENV}" \
    NODE_ENV="${NODE_ENV}" \
    PATH="${PATH}:/home/ruby/.local/bin:/node_modules/.bin" \
    USER="appuser"

COPY --chown=appuser:appuser . .

RUN rails assets:precompile

CMD ["bash"]

###############################################################################

FROM ruby:3.1.2-slim-bullseye AS app

WORKDIR /app

RUN apt-get update \
  && apt-get install -y --no-install-recommends build-essential curl libpq-dev \
  && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man \
  && apt-get clean \
  && useradd --create-home appuser \
  && chown appuser:appuser -R /app

USER appuser

COPY --chown=appuser:appuser bin/ ./bin
RUN chmod 0755 bin/*

ARG RAILS_ENV="production"
ENV RAILS_ENV="${RAILS_ENV}" \
    PATH="${PATH}:/home/ruby/.local/bin" \
    USER="appuser"

COPY --chown=appuser:appuser --from=assets /usr/local/bundle /usr/local/bundle
COPY --chown=appuser:appuser --from=assets /app/public /public
COPY --chown=appuser:appuser . .

ENTRYPOINT ["/app/bin/docker-entrypoint-web"]

EXPOSE 8000

CMD ["rails", "s"]
