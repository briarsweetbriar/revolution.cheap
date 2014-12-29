source 'https://rubygems.org'

gem 'rails'
gem 'rails-api'

gem 'capistrano', '~> 3.1.0'
gem 'capistrano-rails-console', :git => 'git://github.com/valgusk/capistrano-rails-console.git'
gem 'capistrano-bundler', '~> 1.1.2'
gem 'capistrano-rails', '~> 1.1.1'

gem 'capistrano-rbenv', '~> 2.0'

gem "pg"

gem "thin"

gem "active_model_serializers", :git => 'git://github.com/timothycommoner/active_model_serializers.git', branch: "feature/support_polymorphic_associations"

gem "figaro"

gem 'friendly_id'
gem "strip_attributes"

gem 'cancan'
gem "devise"

gem 'carrierwave', '~> 0.9.0'
gem 'mini_magick'

gem "redcarpet"
gem "slim"

gem "quiet_assets"

gem "sprockets", "<= 2.11.0"
gem "coffee-rails"
gem "sass-rails"
gem "uglifier"

gem "jquery-rails"
gem 'jquery-ui-sass-rails'
gem "jquery-fileupload-rails"

gem "ember-rails"
gem "ember-source"
gem "emblem-rails"
gem "handlebars-source"
gem 'ember_simple_auth-rails', '~> 0.5.2'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'byebug'
  gem 'factory_girl_rails'
  gem "guard-rspec"
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'spring-commands-teaspoon'
  gem 'growl'
  gem 'guard-teaspoon', :git => 'git://github.com/modeset/guard-teaspoon.git' 
  gem 'teaspoon'
  gem "phantomjs", ">= 1.8.1.1"
end

group :test do
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'faker'
end

group :production do
  gem "exception_notification", '~> 4.0.1'
end

