class MensajesController < ApplicationController
  before_filter :authenticate_usuario!

  add_crumb "Inicio", :root_path

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

  # GET /mensajes/1
  # GET /mensajes/1.json
  def show
    @mensaje = Mensaje.find(params[:id])
    @mensaje.leido = true if @mensaje.destinatario == current_usuario
    @mensaje.save

    add_crumb "Mis Mensajes", mensajes_path
    add_crumb "Mensaje"

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mensaje }
    end
  end

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
