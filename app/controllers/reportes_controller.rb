##
# ReportesController es el controlador de los Reportes.
# Autentica que el usuario sea un Administrador o Representante
class ReportesController < ApplicationController
  before_filter :authenticate_usuario!, :administrador_o_representante?

  add_crumb "Inicio", :root_path

  ##
  # Renderiza la vista rapida de informacion de reportes
  # [Metodo y Ruta]
  # GET /reportes
  def index
    @rubros = Rubro.all

    add_crumb "Reportes"

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  ##
  # Renderiza un reporte en particular
  # [Metodo y Ruta]
  # GET /reportes/:nombre_del_reporte
  # GET /reportes/:nombre_del_reporte.pdf
  def show
    @reporte = params[:id]

    add_crumb "Reportes", reportes_path
    add_crumb @reporte.humanize

    respond_to do |format|
      format.html { render 'show' }
      format.pdf do
        render :pdf => @reporte.humanize,
               :layout => 'pdf.html.erb',
               :header => {
                         :center             => @reporte.humanize,
                         :left               => 'Informe',
                         :right              => 'Emprender',
                         :line               => true
                },

               :footer => {
                    :left => l(DateTime.now, :format => :long),
                    :right => "Pagina [page] de [toPage]",
                    :line => true
                 }
       end
     end
  end
end
