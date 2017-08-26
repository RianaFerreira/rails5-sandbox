class User < ApplicationRecord
  # attr_accessor :password

  # Add methods to set and authenticate against a BCrypt password
  # http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html
  has_secure_password
  # password_digest attribute added to User model
  # user = User.create(password: '', password_confirmation: '')
  # user.authenticate('valid_password')

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            on: :create

  # has_secure_password replaces all of this:
  # before_save :encrypt_password
  #
  # validates :password, confirmation: true, presence: true
  #
  # def encrypt_password
  #   if password.present?
  #     self.password_salt = BCrypt::Engine.generate_salt
  #     self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  #   end
  # end

  def authenticated(password)
    authenticate(password)
  end
end
