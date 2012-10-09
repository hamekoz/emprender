# RailsAdmin config file. Generated on October 07, 2012 23:13
# See github.com/sferik/rails_admin for more informations

require Rails.root.join('lib', 'rails_admin_acciones_emprender.rb')

RailsAdmin.config do |config|

  ################  Especifico Emprender  ################

  config.actions do
    # root actions
    dashboard                     # mandatory
    # collection actions
    index                         # mandatory
    new
    export
    history_index
    bulk_delete
    # member actions
    show
    edit
    delete
    history_show
    show_in_app

    # Acciones personalizadas
    publicar do
      visible do
        bindings[:abstract_model].model.to_s == "Evento" ||
        bindings[:abstract_model].model.to_s == "Noticia"
      end
    end
    despublicar do
      visible do
        bindings[:abstract_model].model.to_s == "Evento" ||
        bindings[:abstract_model].model.to_s == "Noticia"
      end
    end
    activar do
      visible do
        bindings[:abstract_model].model.to_s == "Usuario" ||
        bindings[:abstract_model].model.to_s == "Administrador" ||
        bindings[:abstract_model].model.to_s == "Representante" ||
        bindings[:abstract_model].model.to_s == "Emprendedor" ||
        bindings[:abstract_model].model.to_s == "Producto" ||
        bindings[:abstract_model].model.to_s == "Servicio"
      end
    end
    desactivar do
      visible do
        bindings[:abstract_model].model.to_s == "Usuario" ||
        bindings[:abstract_model].model.to_s == "Administrador" ||
        bindings[:abstract_model].model.to_s == "Representante" ||
        bindings[:abstract_model].model.to_s == "Emprendedor" ||
        bindings[:abstract_model].model.to_s == "Producto" ||
        bindings[:abstract_model].model.to_s == "Servicio"
      end
    end
    aceptar do
      visible do
        bindings[:abstract_model].model.to_s == "Producto" ||
        bindings[:abstract_model].model.to_s == "Servicio" ||
        bindings[:abstract_model].model.to_s == "Emprendimiento" ||
        bindings[:abstract_model].model.to_s == "Perfil" ||
        bindings[:abstract_model].model.to_s == "Comentario"
      end
    end
    rechazar do
      visible do
        bindings[:abstract_model].model.to_s == "Producto" ||
        bindings[:abstract_model].model.to_s == "Servicio" ||
        bindings[:abstract_model].model.to_s == "Emprendimiento" ||
        bindings[:abstract_model].model.to_s == "Perfil" ||
        bindings[:abstract_model].model.to_s == "Comentario"
      end
    end
  end

  # Autorización con cancan
  config.authorize_with :cancan

  # Configuracion de modelos
  config.model Barrio do
    navigation_label 'Configuracion'
  end

  config.model Categoria do
    navigation_label 'Configuracion'
  end

  config.model Clasificacion do
    navigation_label 'Configuracion'
  end

  config.model Comentario do
    navigation_label 'Portal'
  end

  config.model Emprendimiento do
    navigation_label 'Padron'
  end

  config.model Estado do
    navigation_label 'Configuracion'
  end

  config.model Evento do
    navigation_label 'Portal'
  end

  config.model Noticia do
    navigation_label 'Portal'
    weight -1
    include_all_fields
    field :texto do
      ckeditor true
      ckeditor_config_js '/javascripts/ckeditor/config.js'
      pretty_value do
        value.html_safe
      end
    end
    list do
      field :texto do
        visible false
      end
    end
  end

  config.model Perfil do
    navigation_label 'Padron'
    label "Pefil de Emprendedor" 
    label_plural "Pefiles de Emprendedores"
    weight -2
  end

  config.model Producto do
    navigation_label 'Padron'
  end

  config.model Rubro do
    navigation_label 'Configuracion'
    weight 1
  end

  config.model Servicio do
    navigation_label 'Padron'
  end

  config.model 'Ckeditor::Asset' do
    visible false
  end

  config.model 'Ckeditor::AttachmentFile' do
    visible false
  end

  config.model 'Ckeditor::Picture' do
    visible false
  end
  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Emprender', 'Administracion']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_usuario } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, 'Usuario'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'Usuario'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  # config.excluded_models = ['Administrador', 'Barrio', 'Categoria', 'Ckeditor::Asset', 'Ckeditor::AttachmentFile', 'Ckeditor::Picture', 'Clasificacion', 'Comentario', 'Emprendedor', 'Emprendimiento', 'Estado', 'Evento', 'Institucion', 'Mensaje', 'Noticia', 'Perfil', 'Producto', 'Representante', 'Rubro', 'Servicio', 'Usuario']

  # Include specific models (exclude the others):
  # config.included_models = ['Administrador', 'Barrio', 'Categoria', 'Ckeditor::Asset', 'Ckeditor::AttachmentFile', 'Ckeditor::Picture', 'Clasificacion', 'Comentario', 'Emprendedor', 'Emprendimiento', 'Estado', 'Evento', 'Institucion', 'Mensaje', 'Noticia', 'Perfil', 'Producto', 'Representante', 'Rubro', 'Servicio', 'Usuario']

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]
    config.label_methods = [:etiqueta, :nombre, :titulo]

  ################  Model configuration  ################

  # Each model configuration can alternatively:
  #   - stay here in a `config.model 'ModelName' do ... end` block
  #   - go in the model definition file in a `rails_admin do ... end` block
  
  # This is your choice to make:
  #   - This initializer is loaded once at startup (modifications will show up when restarting the application) but all RailsAdmin configuration would stay in one place.
  #   - Models are reloaded at each request in development mode (when modified), which may smooth your RailsAdmin development workflow.


  # Now you probably need to tour the wiki a bit: https://github.com/sferik/rails_admin/wiki
  # Anyway, here is how RailsAdmin saw your application's models when you ran the initializer:



  ###  Administrador  ###

  # config.model 'Administrador' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your administrador.rb model definition
  
  #   # Found associations:

  #     configure :institucion, :belongs_to_association 
  #     configure :mensajes_recibidos, :has_many_association 
  #     configure :mensajes_enviados, :has_many_association 
  #     configure :noticias, :has_many_association 
  #     configure :eventos, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :nombre, :string 
  #     configure :apellido, :string 
  #     configure :sexo, :enum 
  #     configure :rol, :enum 
  #     configure :institucion_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :confirmation_token, :string 
  #     configure :confirmed_at, :datetime 
  #     configure :confirmation_sent_at, :datetime 
  #     configure :unconfirmed_email, :string 
  #     configure :locked_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Barrio  ###

  # config.model 'Barrio' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your barrio.rb model definition
  
  #   # Found associations:



  #   # Found columns:

  #     configure :id, :integer 
  #     configure :nombre, :string 
  #     configure :descripcion, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Categoria  ###

  # config.model 'Categoria' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your categoria.rb model definition
  
  #   # Found associations:



  #   # Found columns:

  #     configure :id, :integer 
  #     configure :nombre, :string 
  #     configure :descripcion, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Ckeditor::Asset  ###

  # config.model 'Ckeditor::Asset' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your ckeditor/asset.rb model definition
  
  #   # Found associations:

  #     configure :assetable, :polymorphic_association         # Hidden 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :data_file_name, :string 
  #     configure :data_content_type, :string 
  #     configure :data_file_size, :integer 
  #     configure :assetable_id, :integer         # Hidden 
  #     configure :assetable_type, :string         # Hidden 
  #     configure :type, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Ckeditor::AttachmentFile  ###

  # config.model 'Ckeditor::AttachmentFile' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your ckeditor/attachment_file.rb model definition
  
  #   # Found associations:

  #     configure :assetable, :polymorphic_association         # Hidden 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :data_file_name, :string         # Hidden 
  #     configure :data_content_type, :string         # Hidden 
  #     configure :data_file_size, :integer         # Hidden 
  #     configure :data, :paperclip 
  #     configure :assetable_id, :integer         # Hidden 
  #     configure :assetable_type, :string         # Hidden 
  #     configure :type, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Ckeditor::Picture  ###

  # config.model 'Ckeditor::Picture' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your ckeditor/picture.rb model definition
  
  #   # Found associations:

  #     configure :assetable, :polymorphic_association         # Hidden 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :data_file_name, :string         # Hidden 
  #     configure :data_content_type, :string         # Hidden 
  #     configure :data_file_size, :integer         # Hidden 
  #     configure :data, :paperclip 
  #     configure :assetable_id, :integer         # Hidden 
  #     configure :assetable_type, :string         # Hidden 
  #     configure :type, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Clasificacion  ###

  # config.model 'Clasificacion' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your clasificacion.rb model definition
  
  #   # Found associations:



  #   # Found columns:

  #     configure :id, :integer 
  #     configure :codigo, :string 
  #     configure :nombre, :string 
  #     configure :descripcion, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Comentario  ###

  # config.model 'Comentario' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your comentario.rb model definition
  
  #   # Found associations:

  #     configure :comentable, :polymorphic_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :texto, :text 
  #     configure :comentable_id, :integer         # Hidden 
  #     configure :comentable_type, :string         # Hidden 
  #     configure :aceptado, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Emprendedor  ###

  # config.model 'Emprendedor' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your emprendedor.rb model definition
  
  #   # Found associations:

  #     configure :institucion, :belongs_to_association 
  #     configure :mensajes_recibidos, :has_many_association 
  #     configure :mensajes_enviados, :has_many_association 
  #     configure :perfil, :has_one_association 
  #     configure :emprendimiento, :has_one_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :nombre, :string 
  #     configure :apellido, :string 
  #     configure :sexo, :enum 
  #     configure :rol, :enum 
  #     configure :institucion_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :confirmation_token, :string 
  #     configure :confirmed_at, :datetime 
  #     configure :confirmation_sent_at, :datetime 
  #     configure :unconfirmed_email, :string 
  #     configure :locked_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Emprendimiento  ###

  # config.model 'Emprendimiento' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your emprendimiento.rb model definition
  
  #   # Found associations:

  #     configure :emprendedor, :belongs_to_association 
  #     configure :rubro, :belongs_to_association 
  #     configure :clasificacion, :belongs_to_association 
  #     configure :estado, :belongs_to_association 
  #     configure :barrio, :belongs_to_association 
  #     configure :productos, :has_many_association 
  #     configure :servicios, :has_many_association 
  #     configure :comentarios, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :emprendedor_id, :integer         # Hidden 
  #     configure :logotipo_file_name, :string         # Hidden 
  #     configure :logotipo_content_type, :string         # Hidden 
  #     configure :logotipo_file_size, :integer         # Hidden 
  #     configure :logotipo_updated_at, :datetime         # Hidden 
  #     configure :logotipo, :paperclip 
  #     configure :nombre, :string 
  #     configure :es_marca_registrada, :boolean 
  #     configure :marca, :string 
  #     configure :rubro_id, :integer         # Hidden 
  #     configure :clasificacion_id, :integer         # Hidden 
  #     configure :tipo, :enum 
  #     configure :descripcion, :text 
  #     configure :cantidad_de_integrantes, :integer 
  #     configure :roles, :text 
  #     configure :estado_id, :integer         # Hidden 
  #     configure :fecha_de_inicio_de_actividad, :date 
  #     configure :web, :string 
  #     configure :mail, :string 
  #     configure :domicilio, :string 
  #     configure :barrio_id, :integer         # Hidden 
  #     configure :telefono, :string 
  #     configure :celular, :string 
  #     configure :telefono_de_mensajes, :string 
  #     configure :comentario, :string 
  #     configure :condicion_frente_al_iva, :enum 
  #     configure :fecha_de_inscripcion_al_iva, :date 
  #     configure :situacion_frente_al_iva, :enum 
  #     configure :inscripto_en_ingresos_brutos, :boolean 
  #     configure :fecha_de_inscripcion_ingresos_brutos, :date 
  #     configure :recibe_ayuda_de_programas_sociales, :boolean 
  #     configure :programas_sociales_recibidos, :string 
  #     configure :tipo_de_ayuda_recibida_de_programas_sociales, :string 
  #     configure :vinculado_a_sociedad_civil, :boolean 
  #     configure :tipo_de_participacion_en_sociedad_civil, :text 
  #     configure :recibio_ayuda_de_la_sociedad_civil, :boolean 
  #     configure :justificacion_no_haber_recibido_ayuda_de_sociedad_civil, :text 
  #     configure :capacitaciones_recibidas, :text 
  #     configure :maquinarias_y_herramientas_utilizadas, :text 
  #     configure :dispone_de_espacio_fisico, :boolean 
  #     configure :tipo_de_espacio, :enum 
  #     configure :posible_solucion_a_falta_de_espacio, :text 
  #     configure :es_en_vivienda_particular, :boolean 
  #     configure :siendo_en_vivienda_particular_el_espacio_es_suficiente, :boolean 
  #     configure :es_necesario_acondicionamiento, :boolean 
  #     configure :ocupa_lugares_destinados_a_otros_usos, :boolean 
  #     configure :espacio_y_acondicinamiento_requeridos_para_crecer, :text 
  #     configure :caracteristicas_y_zonas_de_clientes_actuales, :text 
  #     configure :cantidad_de_clientes_actuales, :integer 
  #     configure :caracteristicas_y_zonas_de_futuros_clientes, :text 
  #     configure :competencia_en_mismo_barrio, :boolean 
  #     configure :descripcion_de_competencia_en_mismo_barrio, :text 
  #     configure :herramientas_necesarias, :text 
  #     configure :maquinarias_necesarias, :text 
  #     configure :movilidad_necesaria, :text 
  #     configure :insumos_necesarios, :text 
  #     configure :instalaciones_necesarias, :text 
  #     configure :capacitaciones_necesaria, :text 
  #     configure :otras_necesidades, :text 
  #     configure :observaciones, :text 
  #     configure :empadronado, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Estado  ###

  # config.model 'Estado' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your estado.rb model definition
  
  #   # Found associations:



  #   # Found columns:

  #     configure :id, :integer 
  #     configure :nombre, :string 
  #     configure :descripcion, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Evento  ###

  # config.model 'Evento' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your evento.rb model definition
  
  #   # Found associations:

  #     configure :barrio, :belongs_to_association 
  #     configure :autor, :belongs_to_association 
  #     configure :organizador, :belongs_to_association 
  #     configure :comentarios, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :tipo, :enum 
  #     configure :nombre, :string 
  #     configure :descripcion, :text 
  #     configure :lugar, :string 
  #     configure :barrio_id, :integer         # Hidden 
  #     configure :fecha_y_hora_de_inicio, :datetime 
  #     configure :fecha_y_hora_de_finalizacion, :datetime 
  #     configure :autor_id, :integer         # Hidden 
  #     configure :organizador_id, :integer         # Hidden 
  #     configure :folleto_file_name, :string         # Hidden 
  #     configure :folleto_content_type, :string         # Hidden 
  #     configure :folleto_file_size, :integer         # Hidden 
  #     configure :folleto_updated_at, :datetime         # Hidden 
  #     configure :folleto, :paperclip 
  #     configure :publicado, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Institucion  ###

  # config.model 'Institucion' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your institucion.rb model definition
  
  #   # Found associations:

  #     configure :barrio, :belongs_to_association 
  #     configure :administradores, :has_many_association 
  #     configure :representantes, :has_many_association 
  #     configure :emprendedores, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :nombre, :string 
  #     configure :descripcion, :text 
  #     configure :telefono, :string 
  #     configure :domicilio, :string 
  #     configure :barrio_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Mensaje  ###

  # config.model 'Mensaje' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your mensaje.rb model definition
  
  #   # Found associations:

  #     configure :remitente, :belongs_to_association 
  #     configure :destinatario, :belongs_to_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :titulo, :string 
  #     configure :texto, :text 
  #     configure :leido, :boolean 
  #     configure :remitente_id, :integer         # Hidden 
  #     configure :destinatario_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Noticia  ###

  # config.model 'Noticia' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your noticia.rb model definition
  
  #   # Found associations:

  #     configure :autor, :belongs_to_association 
  #     configure :comentarios, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :titulo, :string 
  #     configure :resumen, :text 
  #     configure :texto, :text 
  #     configure :autor_id, :integer         # Hidden 
  #     configure :publicada, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Perfil  ###

  # config.model 'Perfil' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your perfil.rb model definition
  
  #   # Found associations:

  #     configure :emprendedor, :belongs_to_association 
  #     configure :barrio, :belongs_to_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :emprendedor_id, :integer         # Hidden 
  #     configure :dni, :string 
  #     configure :cuit_cuil, :string 
  #     configure :domicilio, :string 
  #     configure :barrio_id, :integer         # Hidden 
  #     configure :telefono_particular, :string 
  #     configure :telefono_celular, :string 
  #     configure :telefono_para_mensajes, :string 
  #     configure :observaciones_de_telefonos, :text 
  #     configure :nivel_de_estudios, :enum 
  #     configure :estudios_completos, :boolean 
  #     configure :titulo, :string 
  #     configure :recibe_o_recibio_algun_plan_social, :boolean 
  #     configure :plan_social, :string 
  #     configure :fecha_de_recepcion, :date 
  #     configure :actividad_laboral_principal, :string 
  #     configure :relacion_laboral, :enum 
  #     configure :cantidad_de_horas_semanales, :integer 
  #     configure :es_unico_ingreso, :boolean 
  #     configure :explicacion_de_ingresos, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Producto  ###

  # config.model 'Producto' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your producto.rb model definition
  
  #   # Found associations:

  #     configure :emprendimiento, :belongs_to_association 
  #     configure :rubro, :belongs_to_association 
  #     configure :comentarios, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :emprendimiento_id, :integer         # Hidden 
  #     configure :rubro_id, :integer         # Hidden 
  #     configure :nombre, :string 
  #     configure :descripcion, :text 
  #     configure :tipo_de_venta, :enum 
  #     configure :precio, :float 
  #     configure :produccion_mensual, :integer 
  #     configure :produccion_anual, :integer 
  #     configure :produccion_maxima, :integer 
  #     configure :imagen_1_file_name, :string         # Hidden 
  #     configure :imagen_1_content_type, :string         # Hidden 
  #     configure :imagen_1_file_size, :integer         # Hidden 
  #     configure :imagen_1_updated_at, :datetime         # Hidden 
  #     configure :imagen_1, :paperclip 
  #     configure :imagen_2_file_name, :string         # Hidden 
  #     configure :imagen_2_content_type, :string         # Hidden 
  #     configure :imagen_2_file_size, :integer         # Hidden 
  #     configure :imagen_2_updated_at, :datetime         # Hidden 
  #     configure :imagen_2, :paperclip 
  #     configure :imagen_3_file_name, :string         # Hidden 
  #     configure :imagen_3_content_type, :string         # Hidden 
  #     configure :imagen_3_file_size, :integer         # Hidden 
  #     configure :imagen_3_updated_at, :datetime         # Hidden 
  #     configure :imagen_3, :paperclip 
  #     configure :imagen_4_file_name, :string         # Hidden 
  #     configure :imagen_4_content_type, :string         # Hidden 
  #     configure :imagen_4_file_size, :integer         # Hidden 
  #     configure :imagen_4_updated_at, :datetime         # Hidden 
  #     configure :imagen_4, :paperclip 
  #     configure :imagen_5_file_name, :string         # Hidden 
  #     configure :imagen_5_content_type, :string         # Hidden 
  #     configure :imagen_5_file_size, :integer         # Hidden 
  #     configure :imagen_5_updated_at, :datetime         # Hidden 
  #     configure :imagen_5, :paperclip 
  #     configure :imagen_6_file_name, :string         # Hidden 
  #     configure :imagen_6_content_type, :string         # Hidden 
  #     configure :imagen_6_file_size, :integer         # Hidden 
  #     configure :imagen_6_updated_at, :datetime         # Hidden 
  #     configure :imagen_6, :paperclip 
  #     configure :activo, :boolean 
  #     configure :aceptado, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Representante  ###

  # config.model 'Representante' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your representante.rb model definition
  
  #   # Found associations:

  #     configure :institucion, :belongs_to_association 
  #     configure :mensajes_recibidos, :has_many_association 
  #     configure :mensajes_enviados, :has_many_association 
  #     configure :noticias, :has_many_association 
  #     configure :eventos, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :nombre, :string 
  #     configure :apellido, :string 
  #     configure :sexo, :enum 
  #     configure :rol, :enum 
  #     configure :institucion_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :confirmation_token, :string 
  #     configure :confirmed_at, :datetime 
  #     configure :confirmation_sent_at, :datetime 
  #     configure :unconfirmed_email, :string 
  #     configure :locked_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Rubro  ###

  # config.model 'Rubro' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your rubro.rb model definition
  
  #   # Found associations:



  #   # Found columns:

  #     configure :id, :integer 
  #     configure :nombre, :string 
  #     configure :descripcion, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Servicio  ###

  # config.model 'Servicio' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your servicio.rb model definition
  
  #   # Found associations:

  #     configure :emprendimiento, :belongs_to_association 
  #     configure :rubro, :belongs_to_association 
  #     configure :comentarios, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :emprendimiento_id, :integer         # Hidden 
  #     configure :rubro_id, :integer         # Hidden 
  #     configure :nombre, :string 
  #     configure :descripcion, :text 
  #     configure :tipo_de_venta, :enum 
  #     configure :precio, :float 
  #     configure :imagen_1_file_name, :string         # Hidden 
  #     configure :imagen_1_content_type, :string         # Hidden 
  #     configure :imagen_1_file_size, :integer         # Hidden 
  #     configure :imagen_1_updated_at, :datetime         # Hidden 
  #     configure :imagen_1, :paperclip 
  #     configure :imagen_2_file_name, :string         # Hidden 
  #     configure :imagen_2_content_type, :string         # Hidden 
  #     configure :imagen_2_file_size, :integer         # Hidden 
  #     configure :imagen_2_updated_at, :datetime         # Hidden 
  #     configure :imagen_2, :paperclip 
  #     configure :imagen_3_file_name, :string         # Hidden 
  #     configure :imagen_3_content_type, :string         # Hidden 
  #     configure :imagen_3_file_size, :integer         # Hidden 
  #     configure :imagen_3_updated_at, :datetime         # Hidden 
  #     configure :imagen_3, :paperclip 
  #     configure :imagen_4_file_name, :string         # Hidden 
  #     configure :imagen_4_content_type, :string         # Hidden 
  #     configure :imagen_4_file_size, :integer         # Hidden 
  #     configure :imagen_4_updated_at, :datetime         # Hidden 
  #     configure :imagen_4, :paperclip 
  #     configure :imagen_5_file_name, :string         # Hidden 
  #     configure :imagen_5_content_type, :string         # Hidden 
  #     configure :imagen_5_file_size, :integer         # Hidden 
  #     configure :imagen_5_updated_at, :datetime         # Hidden 
  #     configure :imagen_5, :paperclip 
  #     configure :imagen_6_file_name, :string         # Hidden 
  #     configure :imagen_6_content_type, :string         # Hidden 
  #     configure :imagen_6_file_size, :integer         # Hidden 
  #     configure :imagen_6_updated_at, :datetime         # Hidden 
  #     configure :imagen_6, :paperclip 
  #     configure :activo, :boolean 
  #     configure :aceptado, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Usuario  ###

  # config.model 'Usuario' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your usuario.rb model definition
  
  #   # Found associations:

  #     configure :institucion, :belongs_to_association 
  #     configure :mensajes_recibidos, :has_many_association 
  #     configure :mensajes_enviados, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :nombre, :string 
  #     configure :apellido, :string 
  #     configure :sexo, :enum 
  #     configure :rol, :enum 
  #     configure :institucion_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :confirmation_token, :string 
  #     configure :confirmed_at, :datetime 
  #     configure :confirmation_sent_at, :datetime 
  #     configure :unconfirmed_email, :string 
  #     configure :locked_at, :datetime 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end

end
