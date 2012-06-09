class NoticiasController < ApplicationController

  # GET /noticias
  # GET /noticias.json
  def index
    @noticias = Noticia.publicadas.page(params[:pagina]).per(10)

    respond_to do |format|
      format.html
      format.json  { render :json => @noticias }
      format.atom
    end
  end

  # GET /noticias/1
  # GET /noticias/1.json
  def show
    @noticia = Noticia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @noticia }
    end
  end
end
