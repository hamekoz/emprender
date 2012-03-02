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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @emprendimiento }
    end
  end

  # GET /emprendimientos/1/edit
  def edit
    @emprendimiento = Emprendimiento.find(params[:id])
  end

  # POST /emprendimientos
  # POST /emprendimientos.json
  def create
    @emprendimiento = Emprendimiento.new(params[:emprendimiento])

    respond_to do |format|
      if @emprendimiento.save
        format.html { redirect_to @emprendimiento, :notice => 'Emprendimiento was successfully created.' }
        format.json { render :json => @emprendimiento, :status => :created, :location => @emprendimiento }
      else
        format.html { render :action => "new" }
        format.json { render :json => @emprendimiento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /emprendimientos/1
  # PUT /emprendimientos/1.json
  def update
    @emprendimiento = Emprendimiento.find(params[:id])

    respond_to do |format|
      if @emprendimiento.update_attributes(params[:emprendimiento])
        format.html { redirect_to @emprendimiento, :notice => 'Emprendimiento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @emprendimiento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /emprendimientos/1
  # DELETE /emprendimientos/1.json
  def destroy
    @emprendimiento = Emprendimiento.find(params[:id])
    @emprendimiento.destroy

    respond_to do |format|
      format.html { redirect_to emprendimientos_url }
      format.json { head :no_content }
    end
  end
end
