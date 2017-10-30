##
# ServiciosEmprendimientoController es el controlador de los servicios de un 
# Emprendimiento, autentica que el usuario sea un Emprendedor
class ServiciosEmprendimientoController < ApplicationController
  before_action :authenticate_usuario!, :emprendedor?

  #add_crumb "Inicio", :root_path
  #add_crumb "Mi Emprendimiento", :mi_emprendimiento_path

  ##
  # Renderiza los servicios del Emprendimiento del Emprendedor actual
  # [Metodo y Ruta]
  # GET /mi_emprendimiento/servicios
  # GET /mi_emprendimiento/servicios.json
  def index
    @q = servicios.search(params[:q])
    @servicios = @q.result(:distinct => true).page(params[:pagina]).per(6)

    add_crumb "Mis Servicios", mi_emprendimiento_servicios_path

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @servicios }
    end
  end

  ## Renderiza la informacion de un servicio particular del Emprendimiento del
  # Emprendedor actual
  # [Metodo y Ruta]
  # GET /mi_emprendimiento/servicios/:id
  # GET /mi_emprendimiento/servicios/:id.json
  def show
    @servicio = servicios.find(params[:id])

    add_crumb "Mis Servicios", mi_emprendimiento_servicios_path
    add_crumb @servicio.nombre

  respond_to do |format|
    format.html{render'show'}
    format.json { render json: @servicio }
   end
  end

  ##
  # Renderiza el formulario de creacion de un nuevo Servicio
  # [Metodo y Ruta]
  # GET /mi_emprendimiento/servicios/nuevo
  # GET /mi_emprendimiento/servicios/nuevo.json
  def new
    @servicio = servicios.new

    add_crumb "Mis Servicios", mi_emprendimiento_servicios_path
    add_crumb "Nuevo"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @servicio }
    end
  end

  ##
  # Renderiza el formulario de edicion de un Servicio
  # [Metodo y Ruta]
  # GET /mi_emprendimiento/servicios/:id/editar
  def edit
    @servicio = servicios.find(params[:id])

    add_crumb "Emprender", root_path
    add_crumb "Mis Servicios", mi_emprendimiento_servicios_path
    add_crumb @servicio.nombre, mi_emprendimiento_servicio_path(@servicio)
    add_crumb "Editar"
  end

  ##
  # Crea un nuevo Servicio del Emprendimiento del Emprendedor actual
  # [Metodo y Ruta]
  # POST /mi_emprendimiento/servicios
  # POST /mi_emprendimiento/servicios.json
  def create
    @servicio = servicios.new(params[:servicio])

    respond_to do |format|
      if @servicio.save
        format.html { redirect_to mi_emprendimiento_servicio_path(@servicio),
                        notice: t('notice.create', :model => 'Servicio') }
        format.json { render json: mi_emprendimiento_servicio_path(@servicio),
                        status: :created, location: @servicio }
      else
        format.html { render action: "new" }
        format.json { render json: @servicio.errors,
                        status: :unprocessable_entity }
      end
    end
  end

  ##
  # Actualiza los datos de un Servicio existe del Emprendimiento del Emprendedor
  # actual
  # [Metodo y Ruta]
  # PUT /mi_emprendimiento/servicios/:id
  # PUT /mi_emprendimiento/servicios/:id.json
  def update
    @servicio = servicios.find(params[:id])

    respond_to do |format|
      if @servicio.update_attributes(params[:servicio])
        format.html { redirect_to mi_emprendimiento_servicio_path(@servicio),
                        notice: t('notice.update', :model => 'Servicio') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @servicio.errors,
                        status: :unprocessable_entity }
      end
    end
  end

  ##
  # Elimina un Servicio del Emprendimiento del Emprendedor actual
  # [Metodo y Ruta]
  # DELETE /mi_emprendimiento/servicios/:id
  # DELETE /mi_emprendimiento/servicios/:id.json
  def destroy
    @servicio = Servicio.find(params[:id])
    @servicio.destroy

    respond_to do |format|
      format.html { redirect_to mi_emprendimiento_servicios_url,
                      notice: t('notice.destroy', :model => 'Servicio') }
      format.json { head :no_content }
    end
  end

private
  ##
  # Devuelve los servicios del Emprendimiento del Emprendedor actual
  def servicios
    current_usuario.emprendimiento.servicios
  end
end
