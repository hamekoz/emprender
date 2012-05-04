class ServiciosController < ApplicationController
  def index
    @servicios = Servicio.activos.page(params[:pagina]).per(12)

    respond_to do |format|
      format.html
      format.json {render :json => @servicios }
    end
  end

  def show
    @servicio = Servicio.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @servicio}
    end
  end
end
