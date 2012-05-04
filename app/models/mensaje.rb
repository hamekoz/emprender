class Mensaje < ActiveRecord::Base
  attr_accessible :texto, :titulo
  
  belongs_to :remitente,    :class_name => :usuario
  belongs_to :destinatario, :class_name => :usuario
end
