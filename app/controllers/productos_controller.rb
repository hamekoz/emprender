class ProductosController < ApplicationController
  def index
    @productos = Producto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @productos }
    end
  end

  def show
  end
end
