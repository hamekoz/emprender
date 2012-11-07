Emprender::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  mount Ckeditor::Engine => "/ckeditor", :as => 'editor'

  root        :to => "application#index"

  match  'acerca' => "application#acerca", :as => "acerca"

  resource :usuario,          :only => :show

  resources :noticias,        :only => [:index, :show]
  resources :eventos,         :only => [:index, :show]
  resources :productos,       :only => [:index, :show]
  resources :servicios,       :only => [:index, :show]
  resources :emprendimientos, :only => [:index, :show]
  resources :reportes,        :only => [:index, :show]

  resources :comentarios,     :only => [:create, :destroy]

  scope(:path_names => { :new => "nuevo", :edit => "editar", :cancel => "cancelar" }) do

  devise_for :usuario, :path => "usuario",
                       :path_names => { :sign_in => 'ingresar',
                                        :sign_out => 'salir',
                                        :password => 'secreto',
                                        :confirmation => 'verificacion',
                                        :unlock => 'desbloquear',
                                        :registration => 'registrar',
                                        :sign_up => 'entrar' }

    resource :perfil,           :except => [:create, :new, :destroy]

    resource :mi_emprendimiento, :controller => 'emprendimiento',
                                 :except => [:create, :new, :destroy] do
      resources :productos, :controller => "productos_emprendimiento"
      resources :servicios, :controller => "servicios_emprendimiento"
    end

    resources :mensajes
    get  "mensajes_enviados" => "mensajes#enviados", :as => "enviados_mensajes"

  end

  namespace :admin do
    resources :noticias,        :path => 'noticia'
    resources :eventos,         :path => 'evento'
    resources :productos,       :path => 'producto'
    resources :servicios,       :path => 'servicio'
    resources :emprendimientos, :path => 'emprendimiento'
  end
end
