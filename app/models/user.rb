class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password_digest,
                  :password, :password_confirmation
  validates :email,
            format: /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i,
            uniqueness: true

end
