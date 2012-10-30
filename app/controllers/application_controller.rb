class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_ability
    @current_ability ||= Ability.new(current_usuario)
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end

  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def acerca
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def emprendedor?
    redirect_to root_path unless current_usuario.emprendedor?
  end
  
  def administrador_o_representante?
      redirect_to root_path unless (current_usuario.administrador? || current_usuario.representante?)
  end
end
