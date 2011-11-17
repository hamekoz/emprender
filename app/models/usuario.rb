class Usuario < ActiveRecord::Base
#Ver https://github.com/rails/rails/blob/master/activemodel/lib/active_model/secure_password.rb
  has_secure_password

  validates :usuario,  :presence => true,
                       :uniqueness => true,
                       :length => { :within => 4..20 }

  validates :password, :length => { :within => 4..20 },
                       :presence => { :on => :create }

  validates :mail,     :presence => true,
                       :uniqueness => true,
                       :length => { :within => 5..50 },
                       :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }
  validates :rol,      :presence => true
  
  belongs_to :persona
  belongs_to :rol

  accepts_nested_attributes_for :persona

  def autenticado?
    authenticate(password)
  end
end
