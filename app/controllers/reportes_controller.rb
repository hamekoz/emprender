class ReportesController < ApplicationController
  before_filter :authenticate_usuario!, :administrador_o_representante?

  # GET /reportes
  def index
    @rubros = Rubro.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /reportes/:nombre
  def show
    @rubros = Rubro.all
    @reporte = params[:id]

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

#               :orientation => 'Landscape',
#               :wkhtmltopdf => '/usr/local/bin/wkhtmltopdf', # path to binary

       end
     end
  end

end
