##
# EmprendimientoController el controlador del Emprendimiento solo visible para
# un Usuario con rol Emprendedor, antes de realizar las acciones verifica que
# exista un usuario autenticado y que su rol se de Emprendedor
class EmprendimientoController < ApplicationController
  before_filter :authenticate_usuario!, :emprendedor?

  add_crumb "Inicio", :root_path

  ##
  # Renderiza la informacion del Emprendimiento el Emprendedor actual
  # [Metodo y Ruta]
  # GET /mi_emprendimiento
  def show
    @emprendimiento = current_usuario.emprendimiento

    add_crumb "Mi Emprendimiento"

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  ##
  # Renderiza el formulario de edicion de Emprendimiento del usuario actual
  # [Metodo y Ruta]
  # GET /mi_emprendimiento/editar
  def edit
    @emprendimiento = current_usuario.emprendimiento

    add_crumb "Mi Emprendimiento", mi_emprendimiento_path
    add_crumb "Editar"
  end

  ##
  # Actualiza los datos del Emprendimiento del usuario actual en caso de fallar
  # redirige nuevamente al formulario indicando los errores pertinentes
  # [Metodo y Ruta]
  # PUT /mi_emprendimiento
  def update
    @emprendimiento = current_usuario.emprendimiento

    respond_to do |format|
      if @emprendimiento.update_attributes(params[:emprendimiento])
        format.html { redirect_to mi_emprendimiento_path,
                                  notice: t('notice.update', :model => 'Emprendimiento') }
      else
        format.html { render action: "edit" }
      end
    end
  end
end
