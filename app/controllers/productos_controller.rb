##
# ProductosController es el controlador de la seccion Productos
class ProductosController < ApplicationController

  add_crumb "Inicio", :root_path

  ## Renderiza la cartelera de los productos que se encuentran visibles
  # Visibles es que estan aceptados y activos
  # [Metodo y Ruta]
  # GET /productos
  # GET /productos.json
  def index
    @q = Producto.visibles.search(params[:q])
    @productos = @q.result(:distinct => true).visibles.page(params[:pagina]).per(6)

    add_crumb "Productos"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @productos }
    end
  end

  ##
  # Renderiza la informacion de un producto en particular
  # [Metodo y Ruta]
  # GET /productos/1
  # GET /productos/1.json
  def show
    @producto = Producto.visibles.find(params[:id])

    add_crumb "Productos", productos_path
    add_crumb @producto.nombre

  respond_to do |format|
    format.html{render'show'}
    format.json { render json: @producto }
   end
  end
end
