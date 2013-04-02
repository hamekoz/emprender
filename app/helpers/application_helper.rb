##
# ApplicationHelper tiene helpers de ayuda accesibles desde todas las vistas
module ApplicationHelper
  ##
  # contiene las class css a implementar por un selector simple implementado con
  # la libreria javascript chosen
  def chosen_simple
    'chzn-select chzn-container chzn-container-single'
  end
end
