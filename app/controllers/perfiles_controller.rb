  class PerfilesController < ApplicationController
  # GET /perfiles
  # GET /perfiles.json
  def index
    @perfiles = Perfil.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @perfiles }
    end
  end

  # GET /perfiles/1
  # GET /perfiles/1.json
  def show
    @perfil = Perfil.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @perfil }
    end
  end

  # GET /perfiles/1/edit
  def edit
    @perfil = Perfil.find(params[:id])
  end

  # PUT /perfiles/1
  # PUT /perfiles/1.json
  def update
    @perfil = Perfil.find(params[:id])

    respond_to do |format|
      if @perfil.update_attributes(params[:perfil])
        format.html { redirect_to @perfil, notice: 'Perfil actualizado.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perfiles/1
  # DELETE /perfiles/1.json
  def destroy
    @perfil = Perfil.find(params[:id])
    @perfil.destroy

    respond_to do |format|
      format.html { redirect_to perfiles_url }
      format.json { head :no_content }
    end
  end
end
