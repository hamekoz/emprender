##
# Ability define las habilidades de un usuario segun su rol
# Implementado con la gema CanCan https://github.com/ryanb/cancan
class Ability
  include CanCan::Ability

  ##
  # Inicializa las habilidades del usuario actual
  def initialize(usuario)
    if usuario && usuario.administrador?
      can :access, :rails_admin
      can :dashboard
      can :manage, :all
      cannot :history, :all
      cannot :show_in_app, Perfil
    elsif usuario && usuario.representante?
      can :access, :rails_admin
      can :dashboard
      can :create, [Emprendimiento, Perfil]
      can :manage, Emprendedor, :institucion_id => nil
      can :manage, [Evento, Noticia], :autor_id => usuario.id
      can [:read, :export], Usuario, :institucion_id => usuario.institucion_id
      can [:read, :export, :show_in_app],
          [Evento, Noticia, Emprendimiento, Producto, Servicio]
      can [:read, :export],
          [Barrio, Categoria, Clasificacion, Estado, Rubro, Institucion, Perfil, Emprendedor, Vinculo, Emprendimiento]
      can [:edit], Emprendedor, :institucion_id => usuario.institucion_id
      can :edit, Institucion, :id => usuario.institucion_id

      cannot :history, :all
      cannot :destroy, Emprendedor
    elsif usuario && usuario.emprendedor?
      can [:read, :edit], Perfil, :id => usuario.perfil.id
      can :create, [Producto, Servicio]
      can [:edit, :destroy], [Producto, Servicio], :emprendimiento_id => usuario.emprendimiento.id
    end
  end
end
