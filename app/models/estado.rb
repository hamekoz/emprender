class Estado < ActiveRecord::Base
  has_many :emprendimientos

  validates :nombre, :presence => true, :uniqueness => true
end
