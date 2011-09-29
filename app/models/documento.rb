class Documento < ActiveRecord::Base
  validates :nombre, :uniqueness => true
            :abreviatura :presence =>true, :uniqueness => true
end
