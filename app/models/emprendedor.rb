class Emprendedor  < ActiveRecord::Base
  belongs_to :usuario
  has_and_belongs_to_many :telefonos

end
