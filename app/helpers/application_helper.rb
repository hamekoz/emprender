module ApplicationHelper

  def boton_mostrar(accion)
    return link_to t('botones.mostrar'), accion, :class => 'accion mostrar boton naranja'
  end

  def boton_agregar(accion)
    return link_to t('botones.agregar'), accion, :class => 'accion agregar boton verde'
  end

  def boton_editar(accion)
    return link_to t('botones.editar'), accion, :class => 'accion editar boton coral'
  end

  def boton_eliminar(accion)
    return link_to t('botones.eliminar'),accion, :method => :delete, :class => 'accion eliminar boton rojo', :confirm => t('confirmar')
  end

  def boton_volver(accion)
    return link_to t('botones.volver'), accion, :class => 'accion volver boton gris'
  end

end
