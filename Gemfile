source "https://rubygems.org"

ruby '3.2.2'

gem "rails", "~> 7.2.1", ">= 7.2.1.1"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"  
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[windows jruby]
gem "bootsnap", require: false
gem 'devise'


group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", require: false

  # Ajout de better_errors pour le développement
  gem "better_errors"

  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem 'letter_opener'
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
