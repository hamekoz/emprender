class NoticiasController < ApplicationController

  # GET /noticias
  # GET /noticias.json
  def index
    @noticias = Noticia.publicadas.page(params[:pagina]).per(1)

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
