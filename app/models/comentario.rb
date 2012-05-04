class Comentario < ActiveRecord::Base
  attr_accessible :leido, :publico, :texto
  
  belongs_to :comentable, :polymorphic => true
end
