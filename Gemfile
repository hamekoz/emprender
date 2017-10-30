source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
gem 'rails-i18n'                  #Localizacion del framework
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'jquery-rails'                #jquery para rails
gem 'jquery-ui-rails'             #jquery-ui para rails
gem 'show_for'                    #Vistas simplificadas
gem 'simple_form'                 #Formularios
gem 'enum'                        #Enumerador
gem 'cancancan'                   #Gestor de permisos
gem 'devise'                      #Gestion de usuarios y sesiones
gem 'devise-i18n'                 #Traduccion de devise
gem 'kaminari'                    #Paginador
gem 'paperclip'                   #Gestor de adjuntos
gem 'paperclip-dropbox','1.1.3'   #Plugin para Dropbox
#gem 'ckeditor'                    #Editor de texto enrriquecido
#gem 'ckeditor_rails'              #Editor de texto enrriquecido para rails
gem 'date_validator'              #Validador de fechas
gem 'ransack'                     #Busqueda
gem 'chosen-rails'                #Selector por combo mejorado
gem 'wicked_pdf'                  #Exportacion a PDF
gem 'bootstrap', '~> 4.0.0.beta'  #Framework CSS y JS
gem 'bootstrap-wysihtml5-rails'   #Editor de texto enrriquecido simple
gem 'crummy'                      #Generador de breadcum
gem 'google-analytics-rails'      #Analisis de visitas
gem 'social-share-button'         #Botones de socializacioin
gem 'figaro'                      #Adminitracion de variable de entorno
gem 'rails_admin', '~> 1.2'       #Administracion del sitio
gem 'rails_admin-i18n'            
gem 'graphael-rails'              #Libreria de graficos
gem 'yaml_db'                     #Gestor de datos
gem 'backup',   :require => false
gem 'whenever', :require => false
gem 'high_voltage'
gem 'enum_help'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'taps'
  gem 'rails-erd'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Gemas necesarias para Heroku
group :heroku do
  gem 'pg'
  gem 'thin'
  gem 'wkhtmltopdf-heroku'
end
