class ServiciosEmprendimientoController < ApplicationController
  before_filter :authenticate_usuario!, :emprendedor?

  # GET /servicios
  # GET /servicios.json
  def index
    @q = servicios.search(params[:q])
    @servicios = @q.result(:distinct => true).page(params[:pagina]).per(6)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @servicios }
    end
  end

  # GET /servicios/1
  # GET /servicios/1.json
  def show
    @servicio = servicios.find(params[:id])

  respond_to do |format|
    format.html{render'show'}
    format.json { render json: @servicio }
   end
  end

  # GET /servicios/new
  # GET /servicios/new.json
  def new
    @servicio = servicios.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @servicio }
    end
  end

  # GET /servicios/1/edit
  def edit
    @servicio = servicios.find(params[:id])
  end

  # POST /servicios
  # POST /servicios.json
  def create
    @servicio = servicios.new(params[:servicio])

    respond_to do |format|
      if @servicio.save
        format.html { redirect_to mi_emprendimiento_producto_path(@servicio),
                        notice: t('notice.create', :model => 'Servicio') }
        format.json { render json: mi_emprendimiento_producto_path(@servicio),
                        status: :created, location: @servicio }
      else
        format.html { render action: "new" }
        format.json { render json: @servicio.errors,
                        status: :unprocessable_entity }
      end
    end
  end

  # PUT /servicios/1
  # PUT /servicios/1.json
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

  # DELETE /servicios/1
  # DELETE /servicios/1.json
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
  def servicios
    current_usuario.emprendimiento.servicios
  end
end
