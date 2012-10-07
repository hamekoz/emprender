class NoticiasController < ApplicationController

  # GET /noticias
  # GET /noticias.json
  def index
    @q = Noticia.publicadas.search(params[:q])
    @noticias = @q.result(:distinct => true).publicadas.page(params[:pagina]).per(6)

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
