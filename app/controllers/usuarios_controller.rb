class UsuariosController < ApplicationController
  before_filter :authenticate_usuario!

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    @usuario = current_usuario

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @usuario }
    end
  end

end
