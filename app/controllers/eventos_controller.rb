class EventosController < ApplicationController

  # GET /eventos
  # GET /eventos.json
  def index
    @eventos = Evento.publicados.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @eventos }
    end
  end

  # GET /eventos/1
  # GET /eventos/1.json
  def show
    @evento = Evento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @evento }
    end
  end
end
