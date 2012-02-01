class NoticiasController < ApplicationController
#  before_filter :autenticar, :except => :cartelera

  # GET /noticias
  # GET /noticias.json
  def cartelera
    @noticias = Noticia.publicadas.all

    respond_to do |format|
      format.html # cartelera.html.erb
      format.json  { render :json => @noticias }
    end
  end

  # GET /noticias
  # GET /noticias.json
  def index
    @noticias = Noticia.all

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @noticias }
    end
  end

  # GET /noticias/1
  # GET /noticias/1.json
  def show
    @noticia = Noticia.find(params[:id])
    @noticias = Noticia.all
    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @noticia }
    end
  end
end
