source 'https://rubygems.org'

gem 'rails', '3.2.13'             #Framework
gem 'rails-i18n'                  #Localizacion del framework

gem 'json'
gem 'jquery-rails'
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
gem 'google-analytics-rails'      #Analisis de visitas
gem 'social-share-button'         #Botones de socializacioin
gem 'figaro'                      #Adminitracion de variable de entorno
gem 'rails_admin'                 #Administracion del sitio
gem 'sqlite3'

# Gemas usadas solo en desarrollo
group :development, :test do
  platforms :ruby_19 do
    gem 'minitest'
    gem 'minitest-rails'
    gem 'bigdecimal'
  end
  gem 'webrick'
  gem 'yaml_db'                   #Gestor de datos
end

# Gemas necesarias para produccion
group :production do
  gem 'activerecord-postgresql-adapter'

  group :local do
    gem 'passenger'                   #Web server para apache y nginx
  end

  group :heroku do
    gem 'wkhtmltopdf-heroku'
    gem 'thin'
  end
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end
