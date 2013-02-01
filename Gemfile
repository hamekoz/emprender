source 'https://rubygems.org'

gem 'rails'
gem 'rails-i18n'

gem 'json'
gem 'show_for'                    #Vistas simplificadas
gem 'simple_form'                 #Formularios
gem 'enum'                        #Enumerador
gem 'cancan'                      #Gestor de permisos
gem 'devise'                      #Gestion de usuarios y sesiones
gem 'devise-i18n'                 #Traduccion de devise
gem 'kaminari'                    #Paginador
gem 'paperclip'                   #Gestor de adjuntos
gem 'ckeditor'                    #Editor de texto enrriquecido
gem 'ckeditor_rails'
gem 'date_validator'              #Validador de fechas
gem 'ransack'                     #Busqueda
gem 'chosen-rails'                #Selector por combo mejorado
gem 'wicked_pdf'                  #Exportacion a PDF
gem 'twitter-bootstrap-rails'     #Framework CSS y JS
gem 'bootstrap-wysihtml5-rails'   #Editor de texto enrriquecido simple
gem 'crummy'                      #Generador de breadcum
#gem 'google-analytics-rails'     #Analisis de visitas

gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'

gem 'jquery-rails'
gem 'yaml_db'                     #Gestor de datos

# Gemas usadas solo en desarrollo
group :development, :test do
  platforms :ruby_19 do
    gem 'minitest'
    gem 'minitest-rails'
    gem 'bigdecimal'
  end
  gem 'sqlite3'
  gem 'webrick'
#  gem 'brakeman'
end

# Gemas necesarias para produccion
group :production do
#  gem 'pg'
  gem 'activerecord-postgresql-adapter'
  gem 'wkhtmltopdf-heroku'
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
