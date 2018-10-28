class User < ApplicationRecord

  # we need this in order to user user.authenticate
  has_secure_password

  validates :email, :password, presence: true
  
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  end
