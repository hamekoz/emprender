class Contacto < ActiveRecord::Base
  validates :email, :uniqueness => true,
                    :length => { :within => 5..50 },
                    :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }

  validates :persona, :presence => true
  
  belongs_to :persona

end



