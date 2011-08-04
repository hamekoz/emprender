module ApplicationHelper

  def boton_mostrar(accion)
    return link_to 'Mostrar', accion, :class => 'accion mostrar boton naranja'
  end

  def boton_agregar(accion)
    return link_to 'Agregar', accion, :class => 'accion agregar boton verde'
  end

  def boton_editar(accion)
    return link_to 'Editar', accion, :class => 'accion editar boton coral'
  end

  def boton_eliminar(accion)
    return link_to 'Eliminar', accion, :confirm => '¿Esta seguro?', :method => :delete, :class => 'accion eliminar boton rojo'
  end

  def boton_volver(accion)
    return link_to 'Volver', accion, :class => 'accion volver boton gris'
  end

end
