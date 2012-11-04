class EventosController < ApplicationController

  add_crumb "Inicio", :root_path

  # GET /eventos
  # GET /eventos.json
  def index
    @q = Evento.publicados.search(params[:q])
    @eventos = @q.result(:distinct => true).publicados.page(params[:pagina]).per(6)

    add_crumb "Eventos"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @eventos }
      format.atom
    end
  end

  # GET /eventos/1
  # GET /eventos/1.json
  def show
    @evento = Evento.find(params[:id])

    add_crumb "Eventos", eventos_path
    add_crumb "#{@evento.tipo}: #{@evento.nombre}"

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @evento }
    end
  end
end
