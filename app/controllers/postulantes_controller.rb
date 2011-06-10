class PostulantesController < ApplicationController
  # GET /postulantes
  # GET /postulantes.xml
  def index
    @postulantes = Postulante.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @postulantes }
    end
  end

  # GET /postulantes/1
  # GET /postulantes/1.xml
  def show
    @postulante = Postulante.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @postulante }
    end
  end

  # GET /postulantes/new
  # GET /postulantes/new.xml
  def new
    @postulante = Postulante.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @postulante }
    end
  end

  # GET /postulantes/1/edit
  def edit
    @postulante = Postulante.find(params[:id])
  end

  # POST /postulantes
  # POST /postulantes.xml
  def create
    @postulante = Postulante.new(params[:postulante])

    respond_to do |format|
      if @postulante.save
        format.html { redirect_to(@postulante, :notice => 'Postulante was successfully created.') }
        format.xml  { render :xml => @postulante, :status => :created, :location => @postulante }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @postulante.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /postulantes/1
  # PUT /postulantes/1.xml
  def update
    @postulante = Postulante.find(params[:id])

    respond_to do |format|
      if @postulante.update_attributes(params[:postulante])
        format.html { redirect_to(@postulante, :notice => 'Postulante was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @postulante.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /postulantes/1
  # DELETE /postulantes/1.xml
  def destroy
    @postulante = Postulante.find(params[:id])
    @postulante.destroy

    respond_to do |format|
      format.html { redirect_to(postulantes_url) }
      format.xml  { head :ok }
    end
  end
end
