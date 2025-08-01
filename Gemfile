source "https://rubygems.org"

ruby "3.4.4"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.2"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Use Tailwind CSS [https://github.com/rails/tailwindcss-rails]
gem "tailwindcss-rails", "~> 3.3.2"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

gem 'pagy', '~> 9.0', '>= 9.0.9'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  gem "error_highlight", ">= 0.4.0", platforms: [:ruby]

  gem "kamal", "1.9.3"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end

# gem 'maglevcms', path: '/Users/did/Documents/NoCoffee/Maglev/maglev-mit', require: false
# gem 'maglevcms-pro', path: '/Users/did/Documents/NoCoffee/Maglev/maglev-pro', require: 'maglev/pro'
# gem "maglevcms-pro", git: "https://github.com/maglevhq/maglev-pro.git", branch: 'master', require: 'maglev/pro'
# gem "ncuikit", path: "/Users/did/Documents/NoCoffee/OSS/ncuikit"

# 🚨 PRODUCTION
gem 'maglevcms', github: 'maglevhq/maglev-core', branch: 'master', require: false
# gem 'maglevcms', github: 'maglevhq/maglev-core', branch: 'master', require: false
# gem "maglevcms-pro", git: "https://github.com/maglevhq/maglev-pro.git", branch: 'master', require: 'maglev/pro'
# gem 'maglevcms-pro', github: 'maglevhq/maglev-pro', ref: '2f70e8b', require: 'maglev/pro'


source 'https://packages.nocoffee.fr/private' do
  # MaglevCMS PRO: multi-sites, multi-themes
  gem 'maglevcms-pro', '~> 1.0.0', require: 'maglev/pro'

  # NoCoffee UIKit to build sleek and consistent UI
  gem 'ncuikit', '~> 0.3.2'
end

gem "redcarpet", "~> 3.6"

gem "honeybadger", "~> 5.8"
