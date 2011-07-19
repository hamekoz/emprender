class Persona < ActiveRecord::Base
  validates :nombre, :presence => true
  validates :apellido, :presence => true

   def nombre_completo
    "#{nombre} #{apellido}"
   end

   def nombre_completo_inverso
    "#{apellido}, #{nombre}"
   end
end
