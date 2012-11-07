##
# PerfilesController es el controlador del Perfil de un Emprendedor
# Antes de ejecutar la acciones autentica que el usuario sea un Emprendedor
class PerfilesController < ApplicationController
  before_filter :authenticate_usuario!, :emprendedor?

  add_crumb "Inicio", :root_path

  ##
  # Renderiza la informacion del Perfil del Emprendedor
  # [Metodo y Ruta]
  # GET /usuario/perfil
  # GET /usuario/perfil.json
  def show
    @perfil = current_usuario.perfil

    add_crumb "Mi Pefil"

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @perfil }
    end
  end

  ##
  # Renderiza el formulario de edicion del Perfil del Emprendedor
  # [Metodo y Ruta]
  # GET /usuario/perfil/editar
  def edit
    @perfil = current_usuario.perfil

    add_crumb "Mi Pefil", perfil_path
    add_crumb "Editar"
  end

  ##
  # Actualiza los datos del Perfil del Emprendedor
  # Redirige al fomulario en caso de que exista algun error
  # [Metodo y Ruta]
  # PUT /usuario/perfil
  # PUT /usuario/perfil.json
  def update
    @perfil = current_usuario.perfil

    respond_to do |format|
      if @perfil.update_attributes(params[:perfil])
        format.html { redirect_to perfil_path, notice: t('notice.update', :model => 'Perfil') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @perfil.errors, status: :unprocessable_entity }
      end
    end
  end
end
