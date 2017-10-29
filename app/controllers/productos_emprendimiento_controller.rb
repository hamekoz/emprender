##
# ProductosEmprendimientoController es el controlador de los productos de un 
# Emprendimiento, autentica que el usuario sea un Emprendedor
class ProductosEmprendimientoController < ApplicationController
  before_action :authenticate_usuario!, :emprendedor?

  add_crumb "Inicio", :root_path
  add_crumb "Mi Emprendimiento", :mi_emprendimiento_path

  ##
  # Renderiza los productos del Emprendimiento del Emprendedor actual
  # [Metodo y Ruta]
  # GET /mi_emprendimiento/productos
  # GET /mi_emprendimiento/productos.json
  def index
    @q = productos.search(params[:q])
    @productos = @q.result(:distinct => true).page(params[:pagina]).per(6)

    add_crumb "Mis Productos"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @productos }
    end
  end

  ## Renderiza la informacion de un producto particular del Emprendimiento del
  # Emprendedor actual
  # [Metodo y Ruta]
  # GET /mi_emprendimiento/productos/:id
  # GET /mi_emprendimiento/productos/:id.json
  def show
    @producto = productos.find(params[:id])

    add_crumb "Mis Productos", mi_emprendimiento_productos_path
    add_crumb @producto.nombre

  respond_to do |format|
    format.html{render'show'}
    format.json { render json: @producto }
   end
  end

  ##
  # Renderiza el formulario de creacion de un nuevo Producto
  # [Metodo y Ruta]
  # GET /mi_emprendimiento/productos/nuevo
  # GET /mi_emprendimiento/productos/nuevo.json
  def new
    @producto = productos.new

    add_crumb "Mis Productos", mi_emprendimiento_productos_path
    add_crumb "Nuevo"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @producto }
    end
  end

  ##
  # Renderiza el formulario de edicion de un Producto
  # [Metodo y Ruta]
  # GET /mi_emprendimiento/productos/:id/editar
  def edit
    @producto = productos.find(params[:id])
    
    add_crumb "Mis Productos", mi_emprendimiento_productos_path
    add_crumb @producto.nombre, mi_emprendimiento_producto_path(@producto)
    add_crumb "Editar"
  end

  ##
  # Crea un nuevo Producto del Emprendimiento del Emprendedor actual
  # [Metodo y Ruta]
  # POST /mi_emprendimiento/productos
  # POST /mi_emprendimiento/productos.json
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

  ##
  # Actualiza los datos de un Producto existe del Emprendimiento del Emprendedor
  # actual
  # [Metodo y Ruta]
  # PUT /mi_emprendimiento/productos/:id
  # PUT /mi_emprendimiento/productos/:id.json
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

  ##
  # Elimina un Producto del Emprendimiento del Emprendedor actual
  # [Metodo y Ruta]
  # DELETE /mi_emprendimiento/productos/:id
  # DELETE /mi_emprendimiento/productos/:id.json
  def destroy
    @producto = productos.find(params[:id])
    @producto.destroy

    respond_to do |format|
      format.html { redirect_to mi_emprendimiento_productos_url,
                      notice: t('notice.destroy', :model => 'Producto') }
      format.json { head :no_content }
    end
  end

private
  ##
  # Devuelve los productos del Emprendimiento del Emprendedor actual
  def productos
    current_usuario.emprendimiento.productos
  end
end
