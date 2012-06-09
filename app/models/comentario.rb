class Comentario < ActiveRecord::Base
  attr_accessible :comentable, :comentable_id,
                  :texto,
                  :moderado, :comentable_type
  belongs_to :comentable, :polymorphic => true
end
