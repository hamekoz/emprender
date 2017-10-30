##
# UsuariosController es el controlador de los datos del Usuario se complementa
# con la gema Devise
class UsuariosController < ApplicationController
  before_action :authenticate_usuario!

  #add_crumb "Inicio", :root_path

  ##
  # Muestra la informacion del Usuario actual
  # [Metodo y Ruta]
  # GET /usuario
  # GET /usuario.json
  def show
    @usuario = current_usuario

    #add_crumb "Mi Usuario"

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @usuario }
    end
  end
end
