source "https://rubygems.org"
ruby "2.4.1"

gem "rails", "~> 5.1.3"

# Use postgres as the database for Active Record
gem "pg"

# Use Puma as the app server
gem "puma"

# Use SCSS for stylesheets
gem "sass-rails"
gem "bootstrap-sass"

# Use ViewModels for reusable view components
gem "cells-rails"
gem "cells-hamlit"

# Use Uglifier as compressor for JavaScript assets
gem "uglifier"
# Use CoffeeScript for .coffee assets and views
gem "coffee-rails"

# Use jquery as the JavaScript library
gem "jquery-rails"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis"

# Password encryption for custom authentication
gem "bcrypt", "~> 3.1.7"

group :development, :test do
  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "byebug", platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "web-console"
  gem "listen", "~> 3.0.5"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen"
end

group :test do
  gem "minitest-reporters"
  gem "capybara"
  gem "simplecov", require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
