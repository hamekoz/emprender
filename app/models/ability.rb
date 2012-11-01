class Ability
  include CanCan::Ability

  def initialize(usuario)

    if usuario && usuario.administrador?
      can :access, :rails_admin
      can :dashboard
      can :manage, :all
      cannot :history, :all
    elsif usuario && usuario.representante?
      can :access, :rails_admin
      can :dashboard
      can :manage, [Evento, Noticia], :autor_id => usuario.id

      can :edit, Emprendedor, :institucion_id => usuario.institucion_id
      can :edit, Emprendedor, :institucion_id => nil

      can :read, Usuario, :id => usuario.id
      can [:read, :history, :export], Usuario, :institucion_id => usuario.institucion_id
      
      cannot :manage, [Usuario], :institucion_id => :nil

      can :edit, Institucion, :id => usuario.institucion_id

      can :show_in_app, [Evento, Noticia]
      can [:read, :history, :export], [Evento, Noticia, Barrio, Categoria, Clasificacion, Estado, Rubro, Institucion, Emprendimiento, Perfil, Producto, Servicio, Emprendedor]

    cannot :history, :all

    elsif usuario && usuario.emprendedor?
      can [:read, :edit], Perfil, :id => usuario.perfil.id
      can :create, [Producto, Servicio]
      can [:edit, :destroy], [Producto, Servicio], :emprendimiento_id => usuario.emprendimiento.id
    end

    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end

## Always performed
#can :access, :rails_admin # needed to access RailsAdmin

## Performed checks for `root` level actions:
#can :dashboard            # dashboard access

## Performed checks for `collection` scoped actions:
#can :index, Model         # included in :read
#can :new, Model           # included in :create
#can :export, Model
#can :history, Model       # for HistoryIndex
#can :destroy, Model       # for BulkDelete

## Performed checks for `member` scoped actions:
#can :show, Model, object            # included in :read
#can :edit, Model, object            # included in :update
#can :destroy, Model, object         # for Delete
#can :history, Model, object         # for HistoryShow
#can :show_in_app, Model, object
