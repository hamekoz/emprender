# RailsAdmin config file. Generated on January 31, 2012 20:47
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  require 'i18n'
  I18n.default_locale = :es

  config.current_user_method { current_usuario } # auto-generated

  config.authorize_with :cancan
  
  # If you want to track changes on your models:
  # config.audit_with :history, Usuario
  
  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, Usuario
  
  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['Emprender', 'Plan Estrategico']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }


  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20

  #  ==> Included models
  # Add all excluded models here:
  # config.excluded_models = [Barrio, Categoria, Clasificacion, Contacto, Emprendedor, Estado, Estudio, Evento, Institucion, Noticia, Persona, Rubro, Usuario]

  # Add models here if you want to go 'whitelist mode':
  # config.included_models = [Barrio, Categoria, Clasificacion, Contacto, Emprendedor, Estado, Estudio, Evento, Institucion, Noticia, Persona, Rubro, Usuario]

  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]
    config.label_methods = [:etiqueta, :nombre, :titulo] # Default is [:name, :title]

  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end

  # Your model's configuration, to help you get started:

  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible. (visible(true))

  # config.model Barrio do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :nombre, :string 
  #     configure :descripcion, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Categoria do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :nombre, :string 
  #     configure :descripcion, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Clasificacion do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :codigo, :string 
  #     configure :nombre, :string 
  #     configure :descripcion, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Contacto do
  #   # Found associations:
  #     configure :persona, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :persona_id, :integer         # Hidden 
  #     configure :mail, :string 
  #     configure :telefono, :string 
  #     configure :celular, :string 
  #     configure :domicilio, :string 
  #     configure :barrio_id, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Emprendedor do
  #   # Found associations:
  #     configure :usuario, :belongs_to_association 
  #     configure :barrio, :belongs_to_association 
  #     configure :estudio, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :usuario_id, :integer         # Hidden 
  #     configure :domicilio, :string 
  #     configure :barrio_id, :integer         # Hidden 
  #     configure :telefono_fijo, :string 
  #     configure :telefono_celular, :string 
  #     configure :telefono_para_mensajes, :string 
  #     configure :observaciones_de_telefonos, :string 
  #     configure :estudio_id, :integer         # Hidden 
  #     configure :cantidad_de_hijos, :enum 
  #     configure :plan_social, :string 
  #     configure :vigencia_desde, :date 
  #     configure :vigencia_hasta, :date 
  #     configure :actividad_laboral_extra, :string 
  #     configure :relacion_de_dependecia, :enum 
  #     configure :relacion_con_el_sector_del_emprendimiento, :enum 
  #     configure :cantidad_de_horas_laborales, :enum 
  #     configure :es_unico_ingreso, :enum 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Estado do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :nombre, :string 
  #     configure :descripcion, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Estudio do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :nombre, :string 
  #     configure :descripcion, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Evento do
  #   # Found associations:
  #     configure :barrio, :belongs_to_association 
  #     configure :organizador, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :tipo, :enum 
  #     configure :nombre, :string 
  #     configure :descripcion, :text 
  #     configure :lugar, :string 
  #     configure :barrio_id, :integer         # Hidden 
  #     configure :fecha_y_hora_de_inicio, :datetime 
  #     configure :fecha_y_hora_de_finalizacion, :datetime 
  #     configure :organizador_id, :integer         # Hidden 
  #     configure :publicado, :boolean 
  #     configure :fecha_de_publicacion, :datetime 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Institucion do
  #   # Found associations:
  #     configure :barrio, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :nombre, :string 
  #     configure :descripcion, :string 
  #     configure :telefono, :string 
  #     configure :domicilio, :string 
  #     configure :barrio_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Noticia do
  #   # Found associations:
  #     configure :autor, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :titulo, :string 
  #     configure :texto, :text 
  #     configure :autor_id, :integer         # Hidden 
  #     configure :fecha, :datetime 
  #     configure :publicada, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Persona do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :nombre, :string 
  #     configure :apellido, :string 
  #     configure :sexo, :enum 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Rubro do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :nombre, :string 
  #     configure :descripcion, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Usuario do
  #   # Found associations:
  #     configure :persona, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :persona_id, :integer         # Hidden 
  #     configure :rol, :enum 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
end
