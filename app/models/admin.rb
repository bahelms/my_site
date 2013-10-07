class Admin < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password, :password_confirmation, presence: true
  has_secure_password
  before_save :create_session_token

  private
    def create_session_token
      self.token = SecureRandom.urlsafe_base64
    end
end
