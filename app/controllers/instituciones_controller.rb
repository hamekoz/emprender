class InstitucionesController < ApplicationController

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
end
