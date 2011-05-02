class Persona < ActiveRecord::Base
  validates :nombres, :presence => true
  validates :apellidos, :presence => true
  validates :email, :uniqueness => true,
                    :length => { :within => 5..50 },
                    :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }

   belongs_to :usuario

   def nombre_completo
    "#{nombres} #{apellidos}"
   end

   def nombre_completo_inverso
    "#{apellidos}, #{nombres}"
   end
end
