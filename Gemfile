source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Ruby version
ruby "3.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
# gem "rails", "~> 7.0.4"
gem "rails", github: "rails/rails", branch: "7-0-stable"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.4"
gem "pg_search", "~> 2.3"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.6"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use pagy for pagination [https://github.com/ddnexus/pagy]
gem "pagy", "~> 6.0"

# Use Rodauth for authenticatiion [https://github.com/janko/rodauth-rails]
gem "rodauth-rails", "~> 1.9"

# Include C extensions for concurrent-ruby
gem "concurrent-ruby-ext"

# Pin to 2.7.x to prevent breaking change in 2.8.x [https://github.com/mikel/mail/issues/1538]
gem "mail", "~> 2.7.1"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # Use Faker to generate test data [https://github.com/faker-ruby/faker/]
  gem "faker", "~> 2.22"

  # Bullet to find n+1 queries
  gem "bullet", "~> 7.0.0"

  # Brakeman for vulnerability scans [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Patch-level verification for bundler [https://github.com/rubysec/bundler-audit]
  gem "bundler-audit", require: false

  # Validate gem checksum integrity [https://github.com/diffend-io/bundler-integrity]
  gem "bundler-integrity", require: false

  # lol_dba for database index analysis [https://github.com/plentz/lol_dba]
  gem "lol_dba", require: false

  # Standardrb for code analysis and formatting [https://github.com/testdouble/standard]
  gem "standardrb", "~> 1.0"

  # Rails generator for Dockerfiles
  gem "dockerfile-rails", ">= 1.5"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
