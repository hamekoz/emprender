class ServiciosController < ApplicationController

  # GET /servicios
  # GET /servicios.json
  def index
    @servicios = Servicio.page(params[:pagina]).per(6)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @servicios }
    end
  end

  # GET /servicios/1
  # GET /servicios/1.json
  def show
    @servicio = Servicio.find(params[:id])

  respond_to do |format|
    format.html{render'show'}
    format.json { render json: @servicio }
   end
  end
end
