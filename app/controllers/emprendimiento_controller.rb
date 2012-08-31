class EmprendimientoController < ApplicationController
  before_filter :authenticate_usuario!, :emprendedor?

  # GET /emprendimientos/1
  # GET /emprendimientos/1.json
  def show
    @emprendimiento = current_usuario.emprendimiento

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @emprendimiento }
    end
  end

  # GET /emprendimientos/1/edit
  def edit
    @emprendimiento = current_usuario.emprendimiento
  end

  # PUT /emprendimientos/1
  # PUT /emprendimientos/1.json
  def update
    @emprendimiento = current_usuario.emprendimiento

    respond_to do |format|
      if @emprendimiento.update_attributes(params[:emprendimiento])
        format.html { redirect_to emprendimiento_path, notice: t('notice.update', :model => 'Emprendimiento') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @emprendimiento.errors, status: :unprocessable_entity }
      end
    end
  end
end
