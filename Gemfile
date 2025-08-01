source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.2"
# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.6"
gem "pg_search", "~> 2.3"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use pagy for pagination [https://github.com/ddnexus/pagy]
gem "pagy", "~> 9.3"

# Use Rodauth for authenticatiion [https://github.com/janko/rodauth-rails]
gem "rodauth-rails", "~> 2.1"
gem "sequel-activerecord_connection"
gem "bcrypt"
gem "tilt"

# Include C extensions for concurrent-ruby [https://github.com/ruby-concurrency/concurrent-ruby]
gem "concurrent-ruby-ext"

# Use Faker to generate test data [https://github.com/faker-ruby/faker/]
gem "faker", "~> 3.5", require: false

# For error monitoring
gem "honeybadger", "~> 6.0"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false

  # Bullet to find n+1 queries [https://rubygems.org/gems/bullet]
  gem "bullet", "~> 8.0.8"

  # Patch-level verification for bundler [https://github.com/rubysec/bundler-audit]
  gem "bundler-audit", require: false

  # Validate gem checksum integrity [https://github.com/diffend-io/bundler-integrity]
  gem "bundler-integrity", require: false

  # lol_dba for database index analysis [https://github.com/plentz/lol_dba]
  gem "lol_dba", require: false
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  gem "rack-mini-profiler"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end
