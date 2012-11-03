class Portada < ActiveRecord::Base
  attr_accessible :foto, :texto, :titulo, :visible

  validates_presence_of :foto, :texto, :titulo

  scope :visibles, where(:visible => true)

  has_attached_file :foto,
                    :default_url => "http://placehold.it/1000x450&text=foto",
                    :styles => {:normal => ["1000x450\!", :png], :thumb => ["400x180>", :png] }

  validates_attachment :foto, :presence => true,
                       :content_type => { :content_type => ['image/gif',
                                                            'image/jpeg',
                                                            'image/pjpeg',
                                                            'image/png',
                                                            'image/tiff'] },
                       :size => { :in => 0..5.megabytes }


  attr_accessor :delete_foto

  before_validation { self.foto.clear if self.delete_foto == '1' }


  def publicar
    self.visible = true
    self.save
  end

  def despublicar
    self.visible = false
    self.save
  end
end
