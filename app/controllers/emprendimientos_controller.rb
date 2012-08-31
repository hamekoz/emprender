class EmprendimientosController < ApplicationController

  # GET /emprendimientos
  # GET /emprendimientos.json
  def index
    @emprendimientos = Emprendimiento.empadronados.page(params[:pagina]).per(6)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @emprendimientos }
    end
  end

  # GET /emprendimientos/1
  # GET /emprendimientos/1.json
  def show
    @emprendimiento = Emprendimiento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @emprendimiento }
    end
  end
end
