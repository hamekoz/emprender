class EmprendimientosController < ApplicationController
  # GET /emprendimientos
  # GET /emprendimientos.json
  def index
    @emprendimientos = Emprendimiento.empadronados.page(params[:pagina]).per(12)

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
      if !current_usuario.nil? && current_usuario.emprendedor? && @emprendimiento = current_usuario.emprendimiento
        format.html {render 'show_privado'}
      else
        format.html # show.html.erb
      end
      format.json { render :json => @emprendimiento }
    end
  end

  # GET /emprendimientos/1/edit
  def edit
    @emprendimiento = Emprendimiento.find(params[:id])
  end

  # PUT /emprendimientos/1
  # PUT /emprendimientos/1.json
  def update
    @emprendimiento = Emprendimiento.find(params[:id])

    respond_to do |format|
      if @emprendimiento.update_attributes(params[:emprendimiento])
        format.html { redirect_to @emprendimiento, notice: t('notice.update', :model => 'Emprendimiento') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @emprendimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /emprendimientos/new
  # GET /emprendimientos/new.json
  def new
    @emprendimiento = Emprendimiento.new
    @emprendimiento.emprendedor = Emprendedor.new

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
        format.html { redirect_to root_path, :notice => 'Su solicitud de empadronamiento se registro con exito.' }
        format.json { render :json => @emprendimiento, :status => :created, :location => @emprendimiento }
      else
        format.html { render :action => "new" }
        format.json { render :json => @emprendimiento.errors, :status => :unprocessable_entity }
      end
    end
  end
end
