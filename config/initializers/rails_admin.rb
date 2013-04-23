# RailsAdmin config file. Generated on November 01, 2012 09:04
# See github.com/sferik/rails_admin for more informations

require Rails.root.join('lib', 'rails_admin_acciones_emprender.rb')

RailsAdmin.config do |config|

  I18n.default_locale = :es

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
    apadrinar do
      visible do
        bindings[:abstract_model].model.to_s == "Emprendedor"
      end
    end
    publicar do
      visible do
        bindings[:abstract_model].model.to_s == "Evento" ||
        bindings[:abstract_model].model.to_s == "Noticia" ||
        bindings[:abstract_model].model.to_s == "Portada" ||
        bindings[:abstract_model].model.to_s == "Vinculo" ||
        bindings[:abstract_model].model.to_s == "Informacion" ||
        bindings[:abstract_model].model.to_s == "Institucion"
      end
    end
    despublicar do
      visible do
        bindings[:abstract_model].model.to_s == "Evento" ||
        bindings[:abstract_model].model.to_s == "Noticia" ||
        bindings[:abstract_model].model.to_s == "Portada" ||
        bindings[:abstract_model].model.to_s == "Vinculo" ||
        bindings[:abstract_model].model.to_s == "Informacion" ||
        bindings[:abstract_model].model.to_s == "Institucion"
      end
    end
    activar do
      visible do
        bindings[:abstract_model].model.to_s == "Producto" ||
        bindings[:abstract_model].model.to_s == "Servicio"
      end
    end
    desactivar do
      visible do
        bindings[:abstract_model].model.to_s == "Producto" ||
        bindings[:abstract_model].model.to_s == "Servicio"
      end
    end
    aceptar do
      visible do
        bindings[:abstract_model].model.to_s == "Producto" ||
        bindings[:abstract_model].model.to_s == "Servicio" ||
        bindings[:abstract_model].model.to_s == "Emprendimiento" ||
        bindings[:abstract_model].model.to_s == "Comentario" ||
        bindings[:abstract_model].model.to_s == "Administrador" ||
        bindings[:abstract_model].model.to_s == "Representante"
      end
    end
    rechazar do
      visible do
        bindings[:abstract_model].model.to_s == "Producto" ||
        bindings[:abstract_model].model.to_s == "Servicio" ||
        bindings[:abstract_model].model.to_s == "Emprendimiento" ||
        bindings[:abstract_model].model.to_s == "Comentario" ||
        bindings[:abstract_model].model.to_s == "Administrador" ||
        bindings[:abstract_model].model.to_s == "Representante"
      end
    end
    desbloquear do
      visible do
        bindings[:abstract_model].model.to_s == "Administrador" ||
        bindings[:abstract_model].model.to_s == "Representante" ||
        bindings[:abstract_model].model.to_s == "Emprendedor"
      end
    end
  end

  # Autorización con cancan
  config.authorize_with :cancan

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
  config.excluded_models = ['Ckeditor::Asset', 'Ckeditor::AttachmentFile', 'Ckeditor::Picture', 'Mensaje']

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

  config.model 'Administrador' do
    list do
#      field :id
      field :aceptado
      field :nombre
      field :apellido
      field :institucion
      field :sexo
      field :email
      field :sign_in_count
      field :last_sign_in_at
      field :locked_at do
        pretty_value do
          bindings[:locked_at].blank? ? "No" : "Si"
        end
      end
      field :created_at
      field :updated_at
    end
    create do
      include_all_fields
    end
    edit do
      include_all_fields
    end
    show do
      exclude_fields :reset_password_sent_at, :current_sign_in_at, :current_sign_in_ip,
                     :last_sign_in_ip, :confirmation_token, :confirmation_sent_at, :confirmed_at,
                     :unconfirmed_email
    end
    create do
      exclude_fields :rol, :reset_password_sent_at, :current_sign_in_at, :current_sign_in_ip,
                     :last_sign_in_ip, :confirmation_token, :confirmation_sent_at, :confirmed_at,
                     :unconfirmed_email, :last_sign_in_at, :sign_in_count, :locked_at,
                     :noticias, :eventos
    end
    edit do
      exclude_fields :rol, :reset_password_sent_at, :current_sign_in_at, :current_sign_in_ip,
                     :last_sign_in_ip, :confirmation_token, :confirmation_sent_at, :confirmed_at,
                     :unconfirmed_email, :last_sign_in_at, :sign_in_count, :locked_at,
                     :noticias, :eventos
    end
    export do
      exclude_fields :password, :reset_password_sent_at, :current_sign_in_at, :current_sign_in_ip,
                     :last_sign_in_ip, :confirmation_token, :confirmation_sent_at, :confirmed_at,
                     :unconfirmed_email
    end
  end


  ###  Barrio  ###

  config.model 'Barrio' do
    navigation_label 'Configuracion'
    list do
      exclude_fields :emprendimientos, :eventos, :perfiles, :instituciones, :id
    end
    create do
      exclude_fields :emprendimientos, :eventos, :perfiles, :instituciones
    end
    edit do
      exclude_fields :emprendimientos, :eventos, :perfiles, :instituciones
    end
  end


  ###  Categoria  ###

  config.model 'Categoria' do
    navigation_label 'Configuracion'
    list do
      exclude_fields :emprendimientos, :id
    end
    create do
      exclude_fields :emprendimientos
    end
    edit do
      exclude_fields :emprendimientos
    end
  end


  ###  Ckeditor::Asset  ###

  config.model 'Ckeditor::Asset' do
    visible false
  end


  ###  Ckeditor::AttachmentFile  ###

  config.model 'Ckeditor::AttachmentFile' do
    visible false
  end


  ###  Ckeditor::Picture  ###

  config.model 'Ckeditor::Picture' do
    visible false
  end


  ###  Clasificacion  ###

  config.model 'Clasificacion' do
    navigation_label 'Configuracion'
    list do
      exclude_fields :emprendimientos, :id
    end
    create do
      exclude_fields :emprendimientos
    end
    edit do
      exclude_fields :emprendimientos
    end
  end


  ###  Comentario  ###

  config.model 'Comentario' do
    navigation_label 'Portal'
    list do
      include_all_fields
      field :comentable_type do
        label "Sobre"
      end
    end
  end


  ###  Emprendedor  ###

  config.model 'Emprendedor' do
    list do
#      field :id
      field :nombre
      field :apellido
      field :perfil do
        nested_form true
      end
      field :emprendimiento do
        nested_form true
      end
      field :institucion
      field :sexo
      field :email
      field :sign_in_count
      field :last_sign_in_at
      field :locked_at do
        pretty_value do
          bindings[:locked_at].blank? ? "No" : "Si"
        end
      end
      field :created_at
      field :updated_at
    end
    show do
      exclude_fields :reset_password_sent_at, :current_sign_in_at, :current_sign_in_ip,
                     :last_sign_in_ip, :confirmation_token, :confirmation_sent_at, :confirmed_at,
                     :unconfirmed_email
    end
    create do
      exclude_fields :rol, :reset_password_sent_at, :current_sign_in_at, :current_sign_in_ip,
                     :last_sign_in_ip, :confirmation_token, :confirmation_sent_at, :confirmed_at,
                     :unconfirmed_email, :last_sign_in_at, :sign_in_count, :locked_at,
                     :perfil, :emprendimiento
    end
    edit do
      exclude_fields :rol, :reset_password_sent_at, :current_sign_in_at, :current_sign_in_ip,
                     :last_sign_in_ip, :confirmation_token, :confirmation_sent_at, :confirmed_at,
                     :unconfirmed_email, :last_sign_in_at, :sign_in_count, :locked_at
    end
    export do
      exclude_fields :password, :reset_password_sent_at, :current_sign_in_at, :current_sign_in_ip,
                     :last_sign_in_ip, :confirmation_token, :confirmation_sent_at, :confirmed_at,
                     :unconfirmed_email
    end
  end


  ###  Emprendimiento  ###

  config.model 'Emprendimiento' do
    navigation_label 'Padron'
    list do
      include_fields :emprendedor, :nombre, :empadronado, :rubro, :marca, :es_marca_registrada,
                     :clasificacion, :categoria, :tipo, :estado, :barrio, :fecha_de_inicio_de_actividad,
                     :condicion_frente_al_iva, :situacion_frente_al_iva, :inscripto_en_ingresos_brutos,
                     :cantidad_de_integrantes, :cantidad_de_clientes_actuales,
                     
                     :created_at, :updated_at
    end
    show do
      exclude_fields :productos, :servicios, :comentarios
    end
    create do
      exclude_fields :productos, :servicios, :comentarios
    end
    edit do
      exclude_fields :productos, :servicios, :comentarios
    end
  end


  ###  Estado  ###

  config.model 'Estado' do
    navigation_label 'Configuracion'
    list do
      exclude_fields :emprendimientos, :id
    end
    create do
      exclude_fields :emprendimientos
    end
    edit do
      exclude_fields :emprendimientos
    end
  end


  ###  Evento  ###

  config.model 'Evento' do
    navigation_label 'Portal'
    weight -1
    include_all_fields
    field :descripcion do
      ckeditor true
      ckeditor_config_js '/javascripts/ckeditor/config.js'
      pretty_value do
        value.html_safe
      end
    end
    list do
#      field :id
      field :tipo
      field :nombre
      field :lugar
      field :domicilio
      field :publicado
      field :organizador
      field :descripcion
      field :fecha_y_hora_de_inicio
      field :fecha_y_hora_de_finalizacion
      field :created_at
      field :updated_at
    end
    list do
      exclude_fields :comentarios
    end
    create do
      field :tipo
      field :nombre
      field :lugar
      field :domicilio
      include_all_fields
      exclude_fields :autor, :comentarios
      field :autor_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
    end
    edit do
      field :tipo
      field :nombre
      field :lugar
      field :domicilio
      include_all_fields
      exclude_fields :autor, :comentarios
    end
    show do
      field :tipo
      field :nombre
      field :lugar
      field :domicilio
      include_all_fields
    end
  end

  ###  Informacion  ###

  config.model 'Informacion' do
    label_plural "Textos en Acerca"
    list do
      field :orden
      field :titulo
      field :subtitulo
      field :visible
      field :updated_at
      exclude_fields :texto
      sort_by :orden
    end
    create do
      include_all_fields
      field :texto do
        bootstrap_wysihtml5 true
        bootstrap_wysihtml5_config_options  "font-styles" => false,
                                            :image => false
      end
    end
    edit do
      include_all_fields
      field :texto do
        bootstrap_wysihtml5 true
        bootstrap_wysihtml5_config_options  "font-styles" => false,
                                            :image => false
      end
    end
  end


  ###  Institucion  ###

  config.model 'Institucion' do
    list do
#      field :id
      field :visible
      include_all_fields
      exclude_fields :administradores, :representantes, :emprendedores, :id
    end
    create do
      exclude_fields :administradores, :representantes, :emprendedores
    end
    edit do
      exclude_fields :administradores, :representantes, :emprendedores
    end
  end


  ###  Mensaje  ###

  # config.model 'Mensaje' do
  # end


  ###  Noticia  ###

  config.model 'Noticia' do
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
      exclude_fields :texto, :id
    end
    list do
      exclude_fields :comentarios
    end
    create do
      exclude_fields :autor, :comentarios
      field :autor_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
    end
    edit do
      exclude_fields :autor, :comentarios
    end
  end


  ###  Perfil  ###

  config.model 'Perfil' do
    navigation_label 'Padron'
    label "Pefil de Emprendedor" 
    label_plural "Pefiles de Emprendedores"
    weight -2
    list do
      include_fields :emprendedor, :dni, :cuit_cuil,
                     :nivel_de_estudios, :estudios_completos, :barrio,
                     :created_at, :updated_at
    end
  end


  ###  Portada  ###

  config.model 'Portada' do
    label "Foto de portada" 
    label_plural "Fotos de portada"
    include_all_fields
    field :foto do
      help "Requerido. Dimension optima 1000x450 px o proporcional"
    end
    show do
      field :foto do
        thumb_method :thumb
      end
    end
    edit do
      field :foto do
        thumb_method :thumb
      end
    end
    list do
      exclude_fields :foto, :texto, :id
    end
  end


  ###  Producto  ###

  config.model 'Producto' do
    navigation_label 'Padron'
    list do
#      field :id
      field :emprendimiento
      field :rubro
      field :nombre
      field :aceptado
      field :activo
      include_all_fields
      exclude_fields :imagen, :imagen_1, :imagen_2, :imagen_3, :id,
                     :imagen_4, :imagen_5, :imagen_6, :comentarios
    end
    create do
      exclude_fields :comentarios, :aceptado
    end
    edit do
      exclude_fields :comentarios, :aceptado
    end
    export do
      exclude_fields :imagen, :imagen_1, :imagen_2, :imagen_3, :imagen_4, :imagen_5, :imagen_6
    end
  end


  ###  Representante  ###

  config.model 'Representante' do
    list do
#      field :id
      field :aceptado
      field :nombre
      field :apellido
      field :institucion
      field :sexo
      field :email
      field :sign_in_count
      field :last_sign_in_at
      field :locked_at do
        pretty_value do
          bindings[:locked_at].blank? ? "No" : "Si"
        end
      end
      field :created_at
      field :updated_at
    end
    create do
      include_all_fields
    end
    edit do
      include_all_fields
    end
    show do
      exclude_fields :reset_password_sent_at, :current_sign_in_at, :current_sign_in_ip,
                     :last_sign_in_ip, :confirmation_token, :confirmation_sent_at, :confirmed_at,
                     :unconfirmed_email
    end
    create do
      exclude_fields :rol, :reset_password_sent_at, :current_sign_in_at, :current_sign_in_ip,
                     :last_sign_in_ip, :confirmation_token, :confirmation_sent_at, :confirmed_at,
                     :unconfirmed_email, :last_sign_in_at, :sign_in_count, :locked_at,
                     :noticias, :eventos
    end
    edit do
      exclude_fields :rol, :reset_password_sent_at, :current_sign_in_at, :current_sign_in_ip,
                     :last_sign_in_ip, :confirmation_token, :confirmation_sent_at, :confirmed_at,
                     :unconfirmed_email, :last_sign_in_at, :sign_in_count, :locked_at,
                     :noticias, :eventos
    end
    export do
      exclude_fields :password, :reset_password_sent_at, :current_sign_in_at, :current_sign_in_ip,
                     :last_sign_in_ip, :confirmation_token, :confirmation_sent_at, :confirmed_at,
                     :unconfirmed_email
    end
  end


  ###  Rubro  ###

  config.model 'Rubro' do
    navigation_label 'Configuracion'
    weight 1
    list do
      exclude_fields :emprendimientos, :productos, :servicios, :id
    end
    create do
      exclude_fields :emprendimientos, :productos, :servicios
    end
    edit do
      exclude_fields :emprendimientos, :productos, :servicios
    end
  end


  ###  Servicio  ###

  config.model 'Servicio' do
    navigation_label 'Padron'
    list do
#      field :id
      field :emprendimiento
      field :rubro
      field :nombre
      field :aceptado
      field :activo
      include_all_fields
      exclude_fields :imagen, :imagen_1, :imagen_2, :imagen_3,
                     :imagen_4, :imagen_5, :imagen_6, :comentarios
    end
    create do
      exclude_fields :comentarios, :aceptado
    end
    edit do
      exclude_fields :comentarios, :aceptado
    end
    export do
      exclude_fields :imagen, :imagen_1, :imagen_2, :imagen_3, :imagen_4, :imagen_5, :imagen_6
    end
  end


  ###  Usuario  ###

  config.model 'Usuario' do
    list do
#      field :id
      field :aceptado
      field :rol
      field :nombre
      field :apellido
      field :institucion
      field :sexo
      field :email
      field :sign_in_count
      field :last_sign_in_at
      field :locked_at do
        pretty_value do
          bindings[:locked_at].blank? ? "No" : "Si"
        end
      end
      field :created_at
      field :updated_at
    end
    show do
      exclude_fields :reset_password_sent_at, :current_sign_in_at, :current_sign_in_ip,
                     :last_sign_in_ip, :confirmation_token, :confirmation_sent_at, :confirmed_at,
                     :unconfirmed_email
    end
    create do
      exclude_fields :reset_password_sent_at, :current_sign_in_at, :current_sign_in_ip,
                     :last_sign_in_ip, :confirmation_token, :confirmation_sent_at, :confirmed_at,
                     :unconfirmed_email, :last_sign_in_at, :sign_in_count, :locked_at
    end
    edit do
      exclude_fields :rol, :reset_password_sent_at, :current_sign_in_at, :current_sign_in_ip,
                     :last_sign_in_ip, :confirmation_token, :confirmation_sent_at, :confirmed_at,
                     :unconfirmed_email, :last_sign_in_at, :sign_in_count, :locked_at
    end
    export do
      exclude_fields :password, :reset_password_sent_at, :current_sign_in_at, :current_sign_in_ip,
                     :last_sign_in_ip, :confirmation_token, :confirmation_sent_at, :confirmed_at,
                     :unconfirmed_email
    end
  end

  ###  Vinculo  ###

  config.model 'Vinculo' do
    field :nombre
    field :url do
      help 'Requerido Ej: http://www.hamekoz.com.ar'
    end
    field :visible
  end

end
