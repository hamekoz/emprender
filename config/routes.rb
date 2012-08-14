Emprender::Application.routes.draw do

  root :to => "application#index"
  match 'acerca' => "application#acerca", :as => "acerca"

  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :usuario

  match "usuario"         => "usuarios#show"
  match "perfil"          => "perfiles#show"
  match "perfil/editar"   => "perfiles#edit", :as => "edit_perfil"
  match "emprendimiento"  => "emprendimientos#emprendimiento", :as => "emprendimiento_usuario"
  match "emprendimiento/editar"   => "emprendimientos#edit", :as => "edit_emprendimiento"

  resources :mensajes
  resources :noticias
  resources :comentarios
  resources :eventos
  resources :emprendimientos do
    resources :productos
    resources :servicios
    resources :comentarios
  end
  resources :emprendedores
  resources :productos
  resources :servicios

namespace :admin do
  resources :noticias, :path => 'noticia'
  resources :eventos, :path => 'evento'
  resources :productos, :path => 'producto'
  resources :servicios, :path => 'servicio'
  resources :emprendimientos, :path => 'emprendimiento'
end




  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
