class SesionesController < ApplicationController
  def crear
    if usuario = Usuario.autenticar(params[:usuario], params[:password])
      session[:usuario_id] = usuario.id
      redirect_to root_path, :notice => "Ingreso exitoso, bienvenido"
    else
      flash.now[:alert] = 
      render :action => 'nueva'
    end
  end

  def destruir
    reset_session
    redirect_to root_path, :notice => "Salida exitosa"
  end
end
