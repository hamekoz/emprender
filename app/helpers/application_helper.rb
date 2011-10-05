module ApplicationHelper

  def boton_mostrar(accion)
    return link_to t('botones.mostrar'), accion, :class => 'btn small info'
  end

  def boton_agregar(accion)
    return link_to t('botones.agregar'), accion, :class => 'btn small success'
  end

  def boton_editar(accion)
    return link_to t('botones.editar'), accion, :class => 'btn small primary'
  end

  def boton_eliminar(accion)
    return link_to t('botones.eliminar'),accion, :method => :delete, :class => 'btn small danger', :confirm => t('confirmar'), :remote => true
  end

  def boton_volver(accion)
    return link_to t('botones.volver'), accion, :class => 'btn small'
  end
  
  def boton_cancelar(accion)
    return link_to t('botones.cancelar'), accion, :class => 'btn small'
  end

end
