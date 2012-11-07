##
# ComentariosController es el controlador de comentarios
class ComentariosController < ApplicationController

  ##
  # Crea un nuevo comentario, lo marca como no aceptado y lo renderiza
  # en pantalla
  # [Metodo y Ruta]
  # POST /comentarios
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
      end
    end
  end
end
