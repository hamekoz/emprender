class ProductosController < ApplicationController
  def index
    @productos = Producto.activos.page(params[:pagina]).per(12)

    respond_to do |format|
      format.html
      format.json {render :json => @productos }
    end
  end

  def show
    @producto = Producto.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @producto}
    end
  end
end
