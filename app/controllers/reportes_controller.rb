class ReportesController < ApplicationController
  before_filter :authenticate_usuario!, :administrador_o_representante?

  add_crumb "Inicio", :root_path

  # GET /reportes
  def index
    @rubros = Rubro.all

    add_crumb "Reportes"

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /reportes/:nombre
  def show
    @rubros = Rubro.all
    @reporte = params[:id]

    add_crumb "Reportes", reportes_path
    add_crumb @reporte.humanize

    respond_to do |format|
      format.html { render'show' }
      format.pdf do
        render :pdf => @reporte.humanize,
               :show_as_html => params[:debug].present?,
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
