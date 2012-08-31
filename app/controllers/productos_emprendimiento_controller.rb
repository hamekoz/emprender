class ProductosEmprendimientoController < ApplicationController
  before_filter :authenticate_usuario!, :emprendedor?

  # GET /productos
  # GET /productos.json
  def index
    @productos = productos.page(params[:pagina]).per(6)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @productos }
    end
  end

  # GET /productos/1
  # GET /productos/1.json
  def show
    @producto = productos.find(params[:id])

  respond_to do |format|
    format.html{render'show'}
    format.json { render json: @producto }
   end
  end

  # GET /productos/new
  # GET /productos/new.json
  def new
    @producto = productos.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @producto }
    end
  end

  # GET /productos/1/edit
  def edit
    @producto = productos.find(params[:id])
  end

  # POST /productos
  # POST /productos.json
  def create
    @producto = productos.new(params[:producto])

    respond_to do |format|
      if @producto.save
        format.html { redirect_to mi_emprendimiento_producto_path(@producto),
                        notice: t('notice.create', :model => 'Producto') }
        format.json { render json: mi_emprendimiento_producto_path(@producto),
                        status: :created, location: @producto }
      else
        format.html { render action: "new" }
        format.json { render json: @producto.errors,
                        status: :unprocessable_entity }
      end
    end
  end

  # PUT /productos/1
  # PUT /productos/1.json
  def update
    @producto = current_usuario.emprendimiento.productos.find(params[:id])

    respond_to do |format|
      if @producto.update_attributes(params[:producto])
        format.html { redirect_to mi_emprendimiento_producto_path(@producto),
                        notice: t('notice.update', :model => 'Producto') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @producto.errors,
                        status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productos/1
  # DELETE /productos/1.json
  def destroy
    @producto = productos.find(params[:id])
    @producto.destroy

    respond_to do |format|
      format.html { redirect_to productos_url }
      format.json { head :no_content }
    end
  end

private
  def productos
    current_usuario.emprendimiento.productos
  end
end
