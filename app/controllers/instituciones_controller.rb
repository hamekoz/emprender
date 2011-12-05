class InstitucionesController < ApplicationController
#  before_filter :autenticar

  # GET /instituciones
  # GET /instituciones.json
  def index
    @instituciones = Institucion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @instituciones }
    end
  end

  # GET /instituciones/1
  # GET /instituciones/1.json
  def show
    @institucion = Institucion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @institucion }
    end
  end

  # GET /instituciones/new
  # GET /instituciones/new.json
  def new
    @institucion = Institucion.new
    @institucion.telefono = Telefono.new
    @institucion.domicilio = Domicilio.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @institucion }
    end
  end

  # GET /instituciones/1/edit
  def edit
    @institucion = Institucion.find(params[:id])
  end

  # POST /instituciones
  # POST /instituciones.json
  def create
    @institucion = Institucion.new(params[:institucion])

    respond_to do |format|
      if @institucion.save
        format.html { redirect_to(@institucion, :notice => 'Institucion creada con exito') }
        format.json  { render :json => @institucion, :status => :created, :location => @institucion }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @institucion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /instituciones/1
  # PUT /instituciones/1.json
  def update
    @institucion = Institucion.find(params[:id])

    respond_to do |format|
      if @institucion.update_attributes(params[:institucion])
        format.html { redirect_to(@institucion, :notice => 'Institucion actualizada con exito') }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @institucion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /instituciones/1
  # DELETE /instituciones/1.json
  def destroy
    @institucion = Institucion.find(params[:id])
    @institucion.destroy

    respond_to do |format|
      format.html { redirect_to(instituciones_url) }
      format.json  { head :ok }
    end
  end
end
