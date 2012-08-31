source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'rails-i18n'

gem 'json'
gem 'show_for'
gem 'simple_form'
gem 'enum'
gem 'cancan'
gem 'devise'
gem 'devise-i18n'
gem 'kaminari'
gem 'paperclip'
gem 'ckeditor'
gem 'date_validator'

gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'

gem 'jquery-rails'
gem 'yaml_db'

# Gemas usadas solo en desarrollo
group :development, :test do
  platforms :ruby_19 do
    gem 'minitest'
    gem 'minitest-rails'
    gem 'bigdecimal'
  end
  gem 'sqlite3'
  gem 'heroku'
end

# Gemas necesarias para produccion
group :production do
  gem 'pg'
#  gem 'therubyracer-heroku', :platform => :ruby
#  gem 'thin'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
#  gem 'twitter-bootstrap-rails', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
