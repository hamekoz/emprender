##
# ServiciosController es el controlador de la seccion Servicio
class ServiciosController < ApplicationController

  add_crumb "Inicio", :root_path

  ## Renderiza la cartelera de los servicios que se encuentran visibles
  # Visibles es que estan aceptados y activos
  # [Metodo y Ruta]
  # GET /servicios
  # GET /servicios.json
  def index
    @q = Servicio.visibles.search(params[:q])
    @servicios = @q.result(:distinct => true).visibles.page(params[:pagina]).per(6)

    add_crumb "Servicios"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @servicios }
    end
  end

  ##
  # Renderiza la informacion de un Servicio en particular
  # [Metodo y Ruta]
  # GET /servicios/1
  # GET /servicios/1.json
  def show
    @servicio = Servicio.visibles.find(params[:id])

    add_crumb "Servicios", servicios_path

  respond_to do |format|
    format.html{render'show'}
    format.json { render json: @servicio }
   end
  end
end
