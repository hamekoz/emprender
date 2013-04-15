source 'https://rubygems.org'

gem 'rails', '3.2.13'             #Framework
gem 'rails-i18n'                  #Localizacion del framework

gem 'jquery-rails'                #jquery para rails
gem 'show_for'                    #Vistas simplificadas
gem 'simple_form'                 #Formularios
gem 'enum'                        #Enumerador
gem 'cancan'                      #Gestor de permisos
gem 'devise'                      #Gestion de usuarios y sesiones
gem 'devise-i18n'                 #Traduccion de devise
gem 'kaminari'                    #Paginador
gem 'paperclip'                   #Gestor de adjuntos
gem 'paperclip-dropbox'           #Plugin para Dropbox
gem 'ckeditor'                    #Editor de texto enrriquecido
gem 'ckeditor_rails'              #Editor de texto enrriquecido para rails
gem 'date_validator'              #Validador de fechas
gem 'ransack'                     #Busqueda
gem 'chosen-rails'                #Selector por combo mejorado
gem 'wicked_pdf'                  #Exportacion a PDF
gem 'twitter-bootstrap-rails'     #Framework CSS y JS
gem 'bootstrap-wysihtml5-rails'   #Editor de texto enrriquecido simple
gem 'crummy'                      #Generador de breadcum
gem 'google-analytics-rails'      #Analisis de visitas
gem 'social-share-button'         #Botones de socializacioin
gem 'figaro'                      #Adminitracion de variable de entorno
gem 'rails_admin'                 #Administracion del sitio
gem 'graphael-rails'              #Libreria de graficos
gem 'yaml_db'                     #Gestor de datos

# Gemas usadas solo en desarrollo
group :development, :test do
  platforms :ruby_19 do
    gem 'minitest'
    gem 'minitest-rails'
    gem 'bigdecimal'
  end
  gem 'webrick'
  gem 'sqlite3'
  gem 'taps'
end

# Gemas necesarias para produccion
group :production do
  gem 'mysql2', :group => :local
  group :heroku do
    gem 'pg'
    gem 'thin'
    gem 'wkhtmltopdf-heroku'
  end
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end
