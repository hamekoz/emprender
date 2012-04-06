class EmprendimientosController < ApplicationController
  # GET /emprendimientos
  # GET /emprendimientos.json
  def index
    @emprendimientos = Emprendimiento.all

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

  # GET /emprendimientos/new
  # GET /emprendimientos/new.json
  def new
    @emprendimiento = Emprendimiento.new
    @emprendimiento.emprendedor = Emprendedor.new
    @emprendimiento.emprendedor.usuario = Usuario.new
    @emprendimiento.emprendedor.usuario.persona = Persona.new
    @emprendimiento.emprendedor.usuario.rol = 'Emprendedor'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @emprendimiento }
    end
  end

  # POST /emprendimientos
  # POST /emprendimientos.json
  def create
    @emprendimiento = Emprendimiento.new(params[:emprendimiento])

    respond_to do |format|
      if @emprendimiento.save
        format.html { redirect_to @emprendimiento, :notice => 'Su solicitud de empadronamiento se registro con exito.' }
        format.json { render :json => @emprendimiento, :status => :created, :location => @emprendimiento }
      else
        format.html { render :action => "new" }
        format.json { render :json => @emprendimiento.errors, :status => :unprocessable_entity }
      end
    end
  end
end
