class BarriosController < ApplicationController
  before_filter :autenticar

  # GET /barrios
  # GET /barrios.xml
  def index
    @barrios = Barrio.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @barrios }
    end
  end

  # GET /barrios/1
  # GET /barrios/1.xml
  def show
    @barrio = Barrio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @barrio }
    end
  end

  # GET /barrios/new
  # GET /barrios/new.xml
  def new
    @barrio = Barrio.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @barrio }
    end
  end

  # GET /barrios/1/edit
  def edit
    @barrio = Barrio.find(params[:id])
  end

  # POST /barrios
  # POST /barrios.xml
  def create
    @barrio = Barrio.new(params[:barrio])

    respond_to do |format|
      if @barrio.save
        format.html { redirect_to(@barrio, :notice => 'Barrio creado con exito') }
        format.xml  { render :xml => @barrio, :status => :created, :location => @barrio }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @barrio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /barrios/1
  # PUT /barrios/1.xml
  def update
    @barrio = Barrio.find(params[:id])

    respond_to do |format|
      if @barrio.update_attributes(params[:barrio])
        format.html { redirect_to(@barrio, :notice => 'Barrio actualizado con exito') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @barrio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /barrios/1
  # DELETE /barrios/1.xml
  def destroy
    @barrio = Barrio.find(params[:id])
    @barrio.destroy

    respond_to do |format|
      format.html { redirect_to(barrios_url) }
      format.xml  { head :ok }
    end
  end
end
