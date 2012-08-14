class EmprendedoresController < ApplicationController

  # GET /emprendedores
  # GET /emprendedores.json
  def index
    @emprendedores = Emprendedor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @emprendedores }
    end
  end

  # GET /emprendedores/1
  # GET /emprendedores/1.json
  def show
    @emprendedor = Emprendedor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @emprendedor }
    end
  end

  # GET /emprendedores/new
  # GET /emprendedores/new.json
  def new
    @emprendedor = Emprendedor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @emprendedor }
    end
  end

  # GET /emprendedores/1/edit
  def edit
    @emprendedor = usuario_current.emprendedor
  end

  # POST /emprendedores
  # POST /emprendedores.json
  def create
    @emprendedor = Emprendedor.new(params[:emprendedor])

    respond_to do |format|
      if @emprendedor.save
        format.html { redirect_to @emprendedor, notice: t('notice.create', :model => 'Emprendedor') }
        format.json { render json: @emprendedor, status: :created, location: @emprendedor }
      else
        format.html { render action: "new" }
        format.json { render json: @emprendedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /emprendedores/1
  # PUT /emprendedores/1.json
  def update
    @emprendedor = Emprendedor.find(params[:id])

    respond_to do |format|
      if @emprendedor.update_attributes(params[:emprendedor])
        format.html { redirect_to @emprendedor, notice: t('notice.update', :model => 'Emprendedor') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @emprendedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emprendedores/1
  # DELETE /emprendedores/1.json
  def destroy
    @emprendedor = Emprendedor.find(params[:id])
    @emprendedor.destroy

    respond_to do |format|
      format.html { redirect_to emprendedores_url }
      format.json { head :no_content }
    end
  end
end
