class Emprendimiento < ActiveRecord::Base
  belongs_to :clasificacion
  belongs_to :estado
  belongs_to :contacto
end
