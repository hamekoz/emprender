##
# MensajesController es el controlador de los mensajes del usuario.
# Antes de efectuar una accion, autentica al usuario

class MensajesController < ApplicationController
  before_action :authenticate_usuario!

  add_crumb "Inicio", :root_path

  ##
  # Renderiza la bandeja de entreada de los mensajes recibidos
  # [Metodo y Ruta]
  # GET /mensajes
  # GET /mensajes.json
  def index
    @q = current_usuario.mensajes_recibidos.recibidos.search(params[:q])
    @recibidos = @q.result(:distinct => true).page(params[:pagina]).per(10)

    add_crumb "Mis Mensajes", mensajes_path
    add_crumb "Bandeja de Entrada"

    respond_to do |format|
      format.html # index.html.erb
      # format.json { render json: @mensajes }
    end
  end

  ##
  # Renderiza la bandeja de salida de los mensajes enviados
  # [Metodo y Ruta]
  # GET /mensajes
  # GET /mensajes.json
  def enviados
    @q = current_usuario.mensajes_enviados.enviados.search(params[:q])
    @enviados = @q.result(:distinct => true).page(params[:pagina]).per(10)

    add_crumb "Mis Mensajes", mensajes_path
    add_crumb "Bandeja de Salida"

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  ##
  # Renderiza la informacion de un mensaje en particular
  # [Metodo y Ruta]
  # GET /mensajes/:id
  # GET /mensajes/:id.json
  def show
    @mensaje = Mensaje.find(params[:id])
    if @mensaje.remitente == current_usuario || @mensaje.destinatario == current_usuario
      @mensaje.leido = true if @mensaje.destinatario == current_usuario
      @mensaje.save

      add_crumb "Mis Mensajes", mensajes_path
      add_crumb "Mensaje"

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @mensaje }
      end
    else
      redirect_to mensajes_path, alert: "No tiene permiso para ver ese mensaje. Esto se debe a que no existe, o usted no es el remitente ni el destinatario de ese mensaje."
    end
  end

  # Renderiza el formulario para enviar un nuevo mensaje.
  # Acepta el parametro _:id_ para identificar un mensaje base.
  # Si existe el parametro _:id_ toma como base del nuevo mensaje el mensaje con
  # atributo *id* = a _:id_
  # En caso de ser un mensaje enviado por el usuario genera un nuevo mensaje de
  # reenvio
  # En caso de ser un mensaje recibido, genera un mensaje de respuesta
  # [Metodo y Ruta]
  # GET /mensajes/new
  # GET /mensajes/new.json
  def new
    @mensaje = Mensaje.new

    add_crumb "Mis Mensajes", mensajes_path
    add_crumb "Redactar"

    if !params[:id].blank?
      @original = Mensaje.find(params[:id])
      @mensaje.texto = "<br>---"
      if @original.remitente == current_usuario
        @mensaje.asunto = "Fwd: #{@original.asunto}"
        @mensaje.texto += "<blockquote>"
        @mensaje.texto += "\nDe: #{@original.remitente.nombre_completo}"
        @mensaje.texto += "\nPara: #{@original.destinatario.nombre_completo}"
        @mensaje.texto += "\nFecha: #{l(@original.created_at, :format => :long)}\n"
      elsif @original.destinatario == current_usuario
        @mensaje.texto += "<blockquote>"
        @mensaje.asunto = "Re: #{@original.asunto}"
        @mensaje.destinatario = @original.remitente
      end
        @mensaje.texto += "\n#{@original.texto}"
        @mensaje.texto += "</blockquote>"
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @producto }
    end
  end

  ##
  # Crea un nuevo mensaje enviado por el usuario actual.
  # Marca por defecto los atributos eliminado_remitente y eliminado_destinatario
  # en falso
  # [Metodo y Ruta]
  # POST /mensajes
  # POST /mensajes.json
  def create
    @mensaje = current_usuario.mensajes_enviados.new(params[:mensaje])
    @mensaje.eliminado_destinatario = false
    @mensaje.eliminado_remitente = false

    respond_to do |format|
      if @mensaje.save
        format.html { redirect_to enviados_mensajes_path, notice: 'Mensaje enviado a ' + @mensaje.destinatario.nombre_completo }
      else
        format.html { render action: "new" }
      end
    end
  end

  ##
  # Elimina un mensaje en particular
  # La eliminacion es en principio logica
  # Si el usuario actual es el remitente establece el atributo
  # eliminado_remitente en verdadero
  # Si el usuario actual es el destinatario establece el atributo
  # eliminado_destinatario en verdadero
  # Si tanto el remitente como el destinatario marcan el mensaje como elimiando
  # este se elimina concretamente del sistema
  # [Metodo y Ruta]
  # DELETE /mensajes/1
  # DELETE /mensajes/1.json
  def destroy
    @mensaje = Mensaje.find(params[:id])

    @mensaje.eliminado_remitente = true if @mensaje.remitente == current_usuario
    @mensaje.eliminado_destinatario = true if @mensaje.destinatario == current_usuario
    @mensaje.save
    @mensaje.destroy if @mensaje.eliminado_remitente? && @mensaje.eliminado_destinatario?

    respond_to do |format|
      format.html { redirect_to @mensaje.remitente == current_usuario ? enviados_mensajes_path : mensajes_url }
      format.json { head :no_content }
    end
  end
end
