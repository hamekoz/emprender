class ClasificacionesController < ApplicationController
#  before_filter :autenticar

  # GET /clasificaciones
  # GET /clasificaciones.json
  def index
    @clasificaciones = Clasificacion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @clasificaciones }
    end
  end

  # GET /clasificaciones/1
  # GET /clasificaciones/1.json
  def show
    @clasificacion = Clasificacion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @clasificacion }
    end
  end

  # GET /clasificaciones/new
  # GET /clasificaciones/new.json
  def new
    @clasificacion = Clasificacion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @clasificacion }
    end
  end

  # GET /clasificaciones/1/edit
  def edit
    @clasificacion = Clasificacion.find(params[:id])
  end

  # POST /clasificaciones
  # POST /clasificaciones.json
  def create
    @clasificacion = Clasificacion.new(params[:clasificacion])

    respond_to do |format|
      if @clasificacion.save
        format.html { redirect_to(@clasificacion, :notice => 'Clasificacion creada con exito') }
        format.json  { render :json => @clasificacion, :status => :created, :location => @clasificacion }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @clasificacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clasificaciones/1
  # PUT /clasificaciones/1.json
  def update
    @clasificacion = Clasificacion.find(params[:id])

    respond_to do |format|
      if @clasificacion.update_attributes(params[:clasificacion])
        format.html { redirect_to(@clasificacion, :notice => 'Clasificacion actualizada con exito') }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @clasificacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clasificaciones/1
  # DELETE /clasificaciones/1.json
  def destroy
    @clasificacion = Clasificacion.find(params[:id])
    @clasificacion.destroy

    respond_to do |format|
      format.html { redirect_to(clasificaciones_url) }
      format.json  { head :ok }
      format.js
    end
  end
end
