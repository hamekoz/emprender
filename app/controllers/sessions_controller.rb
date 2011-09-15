class SessionsController < ApplicationController
  def create
    if usuario = Usuario.autenticar(params[:usuario], params[:password])
      session[:usuario_id] = usuario.id
      redirect_to root_path, :notice => "Bienvenido"
    else
      flash.now[:alert] = "Usuario o Contrase&ntilde;a invalido, intente de nuevo"
      render :action => 'nueva'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, :notice => "Sesion finalizada"
  end
  
  def recuperar
    reset_session
    render :action => 'recupero'
  end
end
