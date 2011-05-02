require 'digest'
class Usuario < ActiveRecord::Base
  attr_accessor :password

  validates :usuario, :presence => true,
                     :uniqueness => true,
                     :length => { :within => 4..20 }
  validates :password, :confirmation => true,
                       :length => { :within => 4..20 },
                       :presence => true,
                       :if => :password_requerida?

  has_one :persona
  belongs_to :rol

  before_save :cifrar_nueva_password

  def self.autenticar(nombre, password)
    usuario = find_by_nombre(nombre)
    return usuario if usuario && usuario.autenticado?(password)
  end

  def autenticado?(password)
    self.password_cifrada == cifrar(password)
  end

  protected
    def cifrar_nueva_password
      return if password.blank?
      self.password_cifrada = cifrar(password)
    end

    def password_requerida?
      password_cifrada.blank? || password.present?
    end

    def cifrar(string)
      Digest::SHA1.hexdigest(string)
    end
end
