class Emprendimiento < ActiveRecord::Base
  belongs_to :emprendedor
  belongs_to :clasificacion
  belongs_to :estado
  belongs_to :contacto
  belongs_to :rubro
  belongs_to :barrio

  def rol_enum
    ['Personal', 'Familiar', 'Asociativo']
  end

  def monotributo_situacion_enum
    ['Al dia', 'Con deudas', 'Otros']
  end

  def produccion_espacio_propio_tipo_enum
    ['Propio','Cedido','Alquilado','Otro']
  end
  
  def venta_tipo_enum
    ['Ferias', 'Locales Propios', 'Mayorista','Supermercados','En su casa','Distribuidores','Vendedores','Al estado','Otros']
  end
end
