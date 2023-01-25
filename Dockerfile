# syntax = docker/dockerfile:experimental
ARG RUBY_VERSION=3.2.0
ARG VARIANT=jemalloc-slim
FROM quay.io/evl.ms/fullstaq-ruby:${RUBY_VERSION}-${VARIANT} as base

ARG BUNDLER_VERSION=2.4.5

ARG RAILS_ENV=production
ENV RAILS_ENV=${RAILS_ENV}

ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

ARG BUNDLE_DEPLOYMENT=true
ARG BUNDLE_WITHOUT=development:test
ARG BUNDLE_PATH=vendor/bundle
ARG BUNDLER_JOBS=4
ENV BUNDLE_DEPLOYMENT ${BUNDLE_DEPLOYMENT}
ENV BUNDLE_WITHOUT ${BUNDLE_WITHOUT}
ENV BUNDLE_PATH ${BUNDLE_PATH}
ENV BUNDLER_JOBS ${BUNDLER_JOBS}

RUN mkdir /app
WORKDIR /app
RUN mkdir -p tmp/pids

SHELL ["/bin/bash", "-c"]

ENV BASH_ENV ~/.bashrc

FROM base as build_deps

ARG DEV_PACKAGES="git build-essential libpq-dev wget vim curl gzip xz-utils libsqlite3-dev"
ENV DEV_PACKAGES ${DEV_PACKAGES}

RUN --mount=type=cache,id=dev-apt-cache,sharing=locked,target=/var/cache/apt \
    --mount=type=cache,id=dev-apt-lib,sharing=locked,target=/var/lib/apt \
    apt-get update -qq && \
    apt-get install --no-install-recommends -y ${DEV_PACKAGES} \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives

FROM build_deps as gems

RUN echo "gem: --no-document" >> ~/.gemrc

RUN gem update -N --system

RUN gem install -N bundler -v ${BUNDLER_VERSION}

COPY Gemfile* ./
RUN bundle install && rm -rf vendor/bundle/ruby/*/cache

FROM base

ARG PROD_PACKAGES="postgresql-client file vim curl gzip libsqlite3-0"
ENV PROD_PACKAGES=${PROD_PACKAGES}

RUN --mount=type=cache,id=prod-apt-cache,sharing=locked,target=/var/cache/apt \
    --mount=type=cache,id=prod-apt-lib,sharing=locked,target=/var/lib/apt \
    apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    ${PROD_PACKAGES} \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives

COPY --from=gems /app /app

ENV SECRET_KEY_BASE 1

ENV RUBY_YJIT_ENABLE 1

COPY . .

RUN bin/rails fly:build

ENV PORT 8080

ARG SERVER_COMMAND="bin/rails fly:server"
ENV SERVER_COMMAND ${SERVER_COMMAND}
CMD ${SERVER_COMMAND}
