class Evento < ActiveRecord::Base
  has_and_belongs_to_many :instituciones
  belongs_to :institucion
end
