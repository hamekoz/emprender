class EmprendedoresController < ApplicationController
  before_filter :autenticar

  # GET /emprendedores
  # GET /emprendedores.xml
  def index
    @emprendedores = Emprendedor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @emprendedores }
    end
  end

  # GET /emprendedores/1
  # GET /emprendedores/1.xml
  def show
    @emprendedor = Emprendedor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @emprendedor }
    end
  end

  # GET /emprendedores/new
  # GET /emprendedores/new.xml
  def new
    @emprendedor = Emprendedor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @emprendedor }
    end
  end

  # GET /emprendedores/1/edit
  def edit
    @emprendedor = Emprendedor.find(params[:id])
  end

  # POST /emprendedores
  # POST /emprendedores.xml
  def create
    @emprendedor = Emprendedor.new(params[:emprendedor])

    respond_to do |format|
      if @emprendedor.save
        format.html { redirect_to(@emprendedor, :notice => 'Emprendedor was successfully created.') }
        format.xml  { render :xml => @emprendedor, :status => :created, :location => @emprendedor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @emprendedor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /emprendedores/1
  # PUT /emprendedores/1.xml
  def update
    @emprendedor = Emprendedor.find(params[:id])

    respond_to do |format|
      if @emprendedor.update_attributes(params[:emprendedor])
        format.html { redirect_to(@emprendedor, :notice => 'Emprendedor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @emprendedor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /emprendedores/1
  # DELETE /emprendedores/1.xml
  def destroy
    @emprendedor = Emprendedor.find(params[:id])
    @emprendedor.destroy

    respond_to do |format|
      format.html { redirect_to(emprendedores_url) }
      format.xml  { head :ok }
    end
  end
end
