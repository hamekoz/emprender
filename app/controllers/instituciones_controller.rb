##
# InstitucionesController es el controlador de la seccion Instituciones
class InstitucionesController < ApplicationController

  add_crumb "Inicio", :root_path

  ##
  #Renderiza la cartelera de las instituciones publicadas
  # [Metodo y Ruta]
  # GET /instituciones
  # GET /instituciones.json
  def index
    @q = Institucion.visibles.search(params[:q])
    @instituciones = @q.result(:distinct => true).visibles.page(params[:pagina]).per(6)

    add_crumb "Acerca de...", acerca_path
    add_crumb "Instituciones"

    respond_to do |format|
      format.html
      format.json  { render :json => @instituciones }
      format.atom
    end
  end
end
