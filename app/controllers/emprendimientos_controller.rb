class EmprendimientosController < ApplicationController

  add_crumb "Inicio", :root_path

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

  # GET /emprendimientos/1
  # GET /emprendimientos/1.json
  def show
    @emprendimiento = Emprendimiento.find(params[:id])

    add_crumb "Emprendimientos", emprendimientos_path

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @emprendimiento }
    end
  end
end
