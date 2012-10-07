class ComentariosController < ApplicationController

  # POST /comentarios
  # POST /comentarios.json
  def create
    @comentario = Comentario.new(params[:comentario])
    @comentario.aceptado = false

    if @comentario.save
      respond_to do |format|
        format.html { redirect_to :back, :notice => "Comentario agregado" }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to :back, :alert => "Error al agregar el comentario" }
#        format.js { render 'fail_create.js.erb' }
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
