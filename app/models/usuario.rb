class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :usuario, :email, :password, :password_confirmation, :remember_me, :persona

  validates :usuario,  :presence => true,
                       :uniqueness => true,
                       :length => { :within => 4..20 }

  belongs_to :persona

  accepts_nested_attributes_for :persona

# Muestra nombre descriptivo en RailsAdmin
  def etiqueta
    usuario
  end

end
