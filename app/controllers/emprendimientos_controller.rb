##
# EmprendimientosController es el controlador de la seccion Emprendimientos
class EmprendimientosController < ApplicationController

#  add_crumb "Inicio", :root_path

  ##
  # Lista todos los emprendimientos marcados como empadronados, acepta parametro
  # de criterios de busqueda, y paginacion cada 10 emprendimientos
  # [Metodo y Ruta]
  # GET /emprendimientos
  # GET /emprendimientos.json
  def index
    @q = Emprendimiento.empadronados.search(params[:q])
    @emprendimientos = @q.result(:distinct => true).empadronados.page(params[:pagina]).per(6)

    add_crumb "Emprendimientos"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @emprendimientos }
    end
  end

  ## Renderiza la informacion de un Emprendimiento particular
  # [Metodo y Ruta]
  # GET /emprendimientos/:id
  # GET /emprendimientos/:id.json
  def show
    @emprendimiento = Emprendimiento.empadronados.find(params[:id])

    add_crumb "Emprendimientos", emprendimientos_path

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @emprendimiento }
    end
  end
end
