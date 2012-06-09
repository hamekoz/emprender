class ComentariosController < ApplicationController

  # POST /comentarios
  # POST /comentarios.json
  def create
    @comentario = Comentario.new(params[:comentario])

    respond_to do |format|
      if @comentario.save
        format.html { redirect_to @comentario, notice: t('notice.create', :model => 'Comentario') }
        format.json { render json: @comentario, status: :created, location: @comentario }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarios/1
  # DELETE /comentarios/1.json
  def destroy
    @comentario = Comentario.find(params[:id])
    @comentario.destroy

    respond_to do |format|
      format.html { redirect_to comentarios_url }
      format.json { head :no_content }
    end
  end
end
