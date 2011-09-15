class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  protected
    def usuario_actual
      return unless session[:usuario_id]
      @usuario_actual ||= Usuario.find_by_id(session[:usuario_id]) 
    end

    helper_method :usuario_actual

    def autenticar
      autenticado? ? true : acceso_denegado
    end

    def autenticado?
      usuario_actual.is_a? Usuario
    end
    
    helper_method :autenticado?
    
    def acceso_denegado
      redirect_to login_path, :notice => "Acceso denegado" and return false
    end 
end
