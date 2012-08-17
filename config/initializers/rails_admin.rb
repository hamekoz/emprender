# RailsAdmin config file. Generated on May 14, 2012 21:35
# See github.com/sferik/rails_admin for more informations

require Rails.root.join('lib', 'rails_admin_acciones_emprender.rb')

RailsAdmin.config do |config|

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
  config.main_app_name = ['Emprender', 'Administracion']
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
  # config.excluded_models = [Administrador, Barrio, Categoria, Ckeditor::Asset, Clasificacion, Comentario, Emprendedor, Emprendimiento, Estado, Evento, Institucion, Mensaje, Noticia, Perfil, Producto, Representante, Rubro, Servicio, Usuario]

  # Add models here if you want to go 'whitelist mode':
  # config.included_models = [Administrador, Barrio, Categoria, Ckeditor::Asset, Clasificacion, Comentario, Emprendedor, Emprendimiento, Estado, Evento, Institucion, Mensaje, Noticia, Perfil, Producto, Representante, Rubro, Servicio, Usuario]

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

#  config.model Emprendedor do
#    navigation_label 'Padron'
#  end

#config.model Noticia do
#    navigation_label 'Portal'
#    include_all_fields
#  edit do
#    field :texto, :rich_editor do
#       config({ 
#         :insert_many => true 
#       })
#    end
#  end
#  list do
#    field :texto do
#      visible false
#    end
#  end
#end

  config.model Noticia do
    navigation_label 'Portal'
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

  # config.model Administrador do
  #   # Found associations:
  #     configure :institucion, :belongs_to_association 
  #     configure :mensajes_recibidos, :has_many_association 
  #     configure :mensajes_enviados, :has_many_association 
  #     configure :noticias, :has_many_association 
  #     configure :eventos, :has_many_association   #   # Found columns:
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
  #     configure :locked_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  config.model Barrio do
    navigation_label 'Configuracion'
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
  end
  config.model Categoria do
    navigation_label 'Configuracion'
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
  end
  config.model Ckeditor::Asset do
#    visible false
  #   # Found associations:
  #     configure :assetable, :polymorphic_association         # Hidden   #   # Found columns:
  #     configure :id, :integer 
  #     configure :data_file_name, :string 
  #     configure :data_content_type, :string 
  #     configure :data_file_size, :integer 
  #     configure :assetable_id, :integer         # Hidden 
  #     configure :assetable_type, :string         # Hidden 
  #     configure :type, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  end
  config.model Clasificacion do
    navigation_label 'Configuracion'
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
  end
  config.model Comentario do
    navigation_label 'Portal'
  #   # Found associations:
  #     configure :comentable, :polymorphic_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :texto, :text 
  #     configure :comentable_id, :integer         # Hidden 
  #     configure :comentable_type, :string         # Hidden 
  #     configure :moderado, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  end
  # config.model Emprendedor do
  #   navigation_label 'Padron'
  #   # Found associations:
  #     configure :institucion, :belongs_to_association 
  #     configure :mensajes_recibidos, :has_many_association 
  #     configure :mensajes_enviados, :has_many_association 
  #     configure :perfil, :has_one_association 
  #     configure :emprendimiento, :has_one_association 
  #     configure :productos, :has_many_association 
  #     configure :servicios, :has_many_association   #   # Found columns:
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
  #     configure :locked_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  config.model Emprendimiento do
    navigation_label 'Padron'
  #   # Found associations:
  #     configure :emprendedor, :belongs_to_association 
  #     configure :rubro, :belongs_to_association 
  #     configure :clasificacion, :belongs_to_association 
  #     configure :estado, :belongs_to_association 
  #     configure :barrio, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :emprendedor_id, :integer         # Hidden 
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
  #     configure :comentarios, :string 
  #     configure :es_monotributista, :boolean 
  #     configure :es_monotributista_social, :boolean 
  #     configure :fecha_de_inscripcion_al_monotributo, :date 
  #     configure :situacion_frente_al_monotributo, :enum 
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
  #     configure :dispone_de_espacio_fisico_para_produccion, :boolean 
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
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  end
  config.model Estado do
    navigation_label 'Configuracion'
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
  end
  config.model Evento do
    navigation_label 'Portal'
  #   # Found associations:
  #     configure :barrio, :belongs_to_association 
  #     configure :autor, :belongs_to_association 
  #     configure :organizador, :belongs_to_association   #   # Found columns:
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
  end
  # config.model Institucion do
  #   # Found associations:
  #     configure :barrio, :belongs_to_association 
  #     configure :administradores, :has_many_association 
  #     configure :representantes, :has_many_association 
  #     configure :emprendedores, :has_many_association   #   # Found columns:
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
  # config.model Mensaje do
  #   # Found associations:
  #     configure :remitente, :belongs_to_association 
  #     configure :destinatario, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :titulo, :string 
  #     configure :texto, :text 
  #     configure :leido, :boolean 
  #     configure :remitente_id, :integer         # Hidden 
  #     configure :destinatario_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  config.model Noticia do
    navigation_label 'Portal'
    weight -1
  #   # Found associations:
  #     configure :autor, :belongs_to_association 
  #     configure :comentarios, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :titulo, :string 
  #     configure :encabezado, :text 
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
  end
  config.model Perfil do
    navigation_label 'Padron'
    label "Pefil de Emprendedor" 
    label_plural "Pefiles de Emprendedores"
    weight -2
  #   # Found associations:
  #     configure :emprendedor, :belongs_to_association 
  #     configure :barrio, :belongs_to_association   #   # Found columns:
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
  #     configure :empadronado, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  end
  config.model Producto do
    navigation_label 'Padron'
  #   # Found associations:
  #     configure :emprendedor, :belongs_to_association 
  #     configure :rubro, :belongs_to_association 
  #     configure :comentarios, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :emprendedor_id, :integer         # Hidden 
  #     configure :rubro_id, :integer         # Hidden 
  #     configure :nombre, :string 
  #     configure :descripcion, :string 
  #     configure :precio, :float 
  #     configure :imagen1, :string 
  #     configure :imagen2, :string 
  #     configure :imagen3, :string 
  #     configure :imagen4, :string 
  #     configure :imagen5, :string 
  #     configure :activo, :boolean 
  #     configure :tipo_de_venta, :string 
  #     configure :produccion_mensual, :integer 
  #     configure :produccion_anual, :integer 
  #     configure :produccion_maxima, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  end
  # config.model Representante do
  #   # Found associations:
  #     configure :institucion, :belongs_to_association 
  #     configure :mensajes_recibidos, :has_many_association 
  #     configure :mensajes_enviados, :has_many_association 
  #     configure :noticias, :has_many_association 
  #     configure :eventos, :has_many_association   #   # Found columns:
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
  #     configure :locked_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  config.model Rubro do
    navigation_label 'Configuracion'
    weight 1
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
  end
  config.model Servicio do
    navigation_label 'Padron'
  #   # Found associations:
  #     configure :emprendedor, :belongs_to_association 
  #     configure :comentarios, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :emprendedor_id, :integer         # Hidden 
  #     configure :rubro_id, :integer 
  #     configure :nombre, :string 
  #     configure :descripcion, :string 
  #     configure :imagen1, :string 
  #     configure :imagen2, :string 
  #     configure :imagen3, :string 
  #     configure :imagen4, :string 
  #     configure :imagen5, :string 
  #     configure :activo, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  end
  # config.model Usuario do
  #   # Found associations:
  #     configure :institucion, :belongs_to_association 
  #     configure :mensajes_recibidos, :has_many_association 
  #     configure :mensajes_enviados, :has_many_association   #   # Found columns:
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
  #     configure :locked_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
end
