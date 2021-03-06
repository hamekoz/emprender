##
# NoticiasController es el controlador de la seccion Noticias
class NoticiasController < ApplicationController

  add_crumb "Inicio", :root_path

  ##
  #Renderiza la cartelera de las noticias publicadas
  # [Metodo y Ruta]
  # GET /noticias
  # GET /noticias.json
  def index
    @q = Noticia.publicadas.search(params[:q])
    @noticias = @q.result(:distinct => true).publicadas.page(params[:pagina]).per(6)

    add_crumb "Noticias"

    respond_to do |format|
      format.html
      format.json  { render :json => @noticias }
      format.atom
    end
  end

  ##
  # Renderiza la informacion de una noticia en particular
  # [Metodo y Ruta]
  # GET /noticias/1
  # GET /noticias/1.json
  def show
    @noticia = Noticia.publicadas.find(params[:id])

    add_crumb "Noticias", noticias_path
    add_crumb @noticia.titulo

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @noticia }
    end
  end
end
