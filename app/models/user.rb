class User < ApplicationRecord
  has_secure_password

  # validates :password_confirmation
  # validates :password, presence: true
end
