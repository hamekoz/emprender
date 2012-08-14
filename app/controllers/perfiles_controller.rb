class PerfilesController < ApplicationController

  before_filter :authenticate_usuario!, :emprendedor?

  # GET /perfiles/1
  # GET /perfiles/1.json
  def show
      @perfil = current_usuario.perfil

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @perfil }
      end
  end

  # GET /perfiles/1/edit
  def edit
    @perfil = current_usuario.perfil
  end

  # PUT /perfiles/1
  # PUT /perfiles/1.json
  def update
    @perfil = Perfil.find(params[:id])

    respond_to do |format|
      if @perfil.update_attributes(params[:perfil])
        format.html { redirect_to @perfil, notice: t('notice.update', :model => 'Perfil') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @perfil.errors, status: :unprocessable_entity }
      end
    end
  end
end
