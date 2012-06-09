source 'https://rubygems.org'

gem 'rails', '3.2.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'json'
gem 'show_for'
gem 'simple_form'
gem 'enum'
gem 'rails-i18n'
gem 'cancan'
gem 'devise'
gem 'kaminari'
gem 'paperclip'
gem 'ckeditor'

gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git',
                               :branch => 'static'
#gem 'rich', :git => 'https://github.com/bastiaanterhorst/rich.git'

# Gemas usadas solo en desarrollo
group :development, :test do
  platforms :ruby_19 do
    gem 'therubyracer'
    gem 'minitest'
    gem 'minitest-rails'
    gem 'bigdecimal'
  end
  gem 'fastercsv',      :platforms => :ruby_18
  gem 'sqlite3'
  gem 'heroku'
end

# Gemas necesarias para produccion
group :production do
  gem 'pg'
#  gem 'thin'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

