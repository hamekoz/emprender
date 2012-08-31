class ProductosController < ApplicationController

  # GET /productos
  # GET /productos.json
  def index
    @productos = Producto.visibles.page(params[:pagina]).per(6)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @productos }
    end
  end

  # GET /productos/1
  # GET /productos/1.json
  def show
    @producto = Producto.find(params[:id])

  respond_to do |format|
    format.html{render'show'}
    format.json { render json: @producto }
   end
  end
end
