class InstitucionesController < ApplicationController
  before_filter :autenticar

  # GET /instituciones
  # GET /instituciones.xml
  def index
    @instituciones = Institucion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @instituciones }
    end
  end

  # GET /instituciones/1
  # GET /instituciones/1.xml
  def show
    @institucion = Institucion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @institucion }
    end
  end

  # GET /instituciones/new
  # GET /instituciones/new.xml
  def new
    @institucion = Institucion.new
    @institucion.telefono = Telefono.new
    @institucion.domicilio = Domicilio.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @institucion }
    end
  end

  # GET /instituciones/1/edit
  def edit
    @institucion = Institucion.find(params[:id])
  end

  # POST /instituciones
  # POST /instituciones.xml
  def create
    @institucion = Institucion.new(params[:institucion])

    respond_to do |format|
      if @institucion.save
        format.html { redirect_to(@institucion, :notice => 'Institucion was successfully created.') }
        format.xml  { render :xml => @institucion, :status => :created, :location => @institucion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @institucion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /instituciones/1
  # PUT /instituciones/1.xml
  def update
    @institucion = Institucion.find(params[:id])

    respond_to do |format|
      if @institucion.update_attributes(params[:institucion])
        format.html { redirect_to(@institucion, :notice => 'Institucion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @institucion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /instituciones/1
  # DELETE /instituciones/1.xml
  def destroy
    @institucion = Institucion.find(params[:id])
    @institucion.destroy

    respond_to do |format|
      format.html { redirect_to(instituciones_url) }
      format.xml  { head :ok }
    end
  end
end
