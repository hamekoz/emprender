class Telefono < ActiveRecord::Base
  validates :fijo, :uniqueness => true
  validates :celular, :uniqueness => true
  validates :mensajes, :uniqueness => true
end

