# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.4.4
FROM registry.docker.com/library/ruby:$RUBY_VERSION-slim as base

# Rails app lives here
WORKDIR /rails

# Set production environment
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"


# Throw-away build stage to reduce size of final image
FROM base as build

# Install packages needed to build gems
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libpq-dev libvips libyaml-dev pkg-config

# Install application gems
COPY Gemfile Gemfile.lock ./

RUN --mount=type=secret,id=BUNDLE_GITHUB__COM \
  echo "🚀 BUNDLE_GITHUB__COM = $(cat /run/secrets/BUNDLE_GITHUB__COM)"

RUN --mount=type=secret,id=BUNDLE_PACKAGES__NOCOFFEE__FR \
echo "🚀 BUNDLE_PACKAGES__NOCOFFEE__FR = $(cat /run/secrets/BUNDLE_PACKAGES__NOCOFFEE__FR)"

RUN --mount=type=secret,id=BUNDLE_GITHUB__COM \
    --mount=type=secret,id=BUNDLE_PACKAGES__NOCOFFEE__FR \
  BUNDLE_GITHUB__COM=$(cat /run/secrets/BUNDLE_GITHUB__COM) \
  BUNDLE_PACKAGES__NOCOFFEE__FR=$(cat /run/secrets/BUNDLE_PACKAGES__NOCOFFEE__FR) \
  bundle install && \
  rm -rf /usr/local/bundle/cache

RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
    bundle exec bootsnap precompile --gemfile

# Copy application code
COPY . .

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile app/ lib/

# Install packaged need to build JS libs
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y nodejs \
    npm 
RUN npm install -g yarn@1.22.6

# Precompiling assets for production without requiring secret RAILS_MASTER_KEY
RUN --mount=type=secret,id=MAGLEV_ADMIN_USERNAME \
    --mount=type=secret,id=MAGLEV_ADMIN_PASSWORD \
    MAGLEV_ADMIN_USERNAME=$(cat /run/secrets/MAGLEV_ADMIN_USERNAME) \
    MAGLEV_ADMIN_PASSWORD=$(cat /run/secrets/MAGLEV_ADMIN_PASSWORD) \
    SECRET_KEY_BASE_DUMMY=1 ./bin/rails maglev_pro:copy_tailwindcss_config assets:precompile maglev:vite:copy_public_dir

# Final stage for app image
FROM base

# Install packages needed for deployment
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl libvips postgresql-client && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Copy built artifacts: gems, application
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

# Run and own only the runtime files as a non-root user for security
RUN useradd rails --create-home --shell /bin/bash && \
    chown -R rails:rails db log storage tmp
USER rails:rails

# Entrypoint prepares the database.
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD ["./bin/rails", "server"]
