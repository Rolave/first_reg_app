class User < ApplicationRecord
  validates :email, uniqueness: true
  has_many :posts
  # attr_accesor :password
  # attr_accesor :password_confirmation
end
