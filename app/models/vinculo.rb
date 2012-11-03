class Vinculo < ActiveRecord::Base
  attr_accessible :nombre, :url, :visible

  validates_presence_of :nombre, :url

  validates :url,
            :uniqueness => true,
            :format => { :with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix }

  scope :visibles, where(:visible => true)

  def publicar
    self.visible = true
    self.save
  end

  def despublicar
    self.visible = false
    self.save
  end
end
