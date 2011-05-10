class Persona < ActiveRecord::Base
  validates :nombre, :presence => true
  validates :apellido, :presence => true
  validates :email, :uniqueness => true,
                    :length => { :within => 5..50 },
                    :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }

   belongs_to :usuario

   def nombre_completo
    "#{nombre} #{apellido}"
   end

   def nombre_completo_inverso
    "#{apellido}, #{nombre}"
   end
end
