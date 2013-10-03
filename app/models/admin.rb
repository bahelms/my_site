class Admin < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password, :password_confirmation, presence: true
  has_secure_password
end
