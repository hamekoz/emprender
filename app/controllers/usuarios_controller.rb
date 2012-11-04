class UsuariosController < ApplicationController
  before_filter :authenticate_usuario!

  add_crumb "Inicio", :root_path

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    @usuario = current_usuario

    add_crumb "Mi Usuario"

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @usuario }
    end
  end

end
