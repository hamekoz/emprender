module ApplicationHelper

  def boton_mostrar(accion)
    return link_to 'Mostrar', accion, :class => 'mostrar boton naranja'
  end

  def boton_agregar(accion)
    return link_to 'Agregar', accion, :class => 'agregar boton verde'
  end

  def boton_editar(accion)
    return link_to 'Editar', accion, :class => 'editar boton coral'
  end

  def boton_eliminar(accion)
    return link_to 'Eliminar', accion, :confirm => '¿Esta seguro?', :method => :delete, :class => 'eliminar boton rojo'
  end

  def boton_volver(accion)
    return link_to 'Volver', accion, :class => 'volver boton gris'
  end

end
