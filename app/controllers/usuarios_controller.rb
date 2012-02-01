class UsuariosController < ApplicationController
#  before_filter :autenticar

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @usuario }
    end
  end

  # GET /usuarios/1/edit
  def edit
    @usuario = Usuario.find(params[:id])
  end

  # PUT /usuarios/1
  # PUT /usuarios/1.json
  def update
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      if @usuario.update_attributes(params[:usuario])
        format.html { redirect_to(@usuario, :notice => 'Usuario actualizado con exito') }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @usuario.errors, :status => :unprocessable_entity }
      end
    end
  end
end
