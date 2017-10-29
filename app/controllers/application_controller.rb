##
# ApplicationController es el controlador principal de Emprender
# Provee metodos generales a todos los controladores y renderiza la pagina
# inicial y la de informacion acerca de Emprender
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  ##
  # Define la habilidad del usuario actual definidas en Ability
  def current_ability
    @current_ability ||= Ability.new(current_usuario)
  end

  ##
  # Establece la accion de rescate cuando el usuario no tiene permitido ejecutar
  # una accion que intenta llevar a cabo. Los permisos se definen con CanCan en
  # la clase Ability
  # Por defecto muestra un mensaje informando la falta de permiso y redirige a
  # la pagina inicial
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end

  ##
  # Renderiza la pagina incial del sitio mostrando en el carusel de fotos los
  # elementos Portada cuyo atributo visible sea verdadero
  def index
    @fotos = Portada.visibles.all

    add_crumb "Inicio"

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  ##
  # Renderiza la pagina Acerca, recolecta informacion de toda Institucion,
  # Informacion y Vinculo cuyo atributo visible sea verdadero
  def acerca
    @informaciones = Informacion.visibles
    @instituciones = Institucion.visibles
    @vinculos = Vinculo.visibles

    add_crumb "Inicio", root_path
    add_crumb "Acerca de ..."

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  ##
  # Redirige a la pagina principal a menos que el usuario sea un emprendedor
  # Se utiliza en las validaciones de previas al renderizado
  def emprendedor?
    redirect_to root_path unless current_usuario.emprendedor?
  end

  ##
  # Redirige a la pagina principal a menos que el usuario sea un Administrador
  # o Representante
  # Se utiliza en las validaciones de previas al renderizado
  def administrador_o_representante?
      redirect_to root_path unless (current_usuario.administrador? || current_usuario.representante?)
  end
end
