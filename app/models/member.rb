# include BCrypt
class Member < ActiveRecord::Base
  # has_secure_password
  # # has_many :samples
  # # :avatar, :first_name, :last_name, :email, :alter_ego, :password_digest, :location, :title, :education, :haiku, :fav_style_manual, :fav_rule, :acct_type

  # attr_accessor :first_name, :alter_ego, :acct_type, :password_digest, :email

  # before_save { self.email = email.downcase }

  # validates :first_name,
  #   presence: true,
  #   format: { with: /[A-Za-z,0-9.-]/ }

  # validates :alter_ego,
  #   presence: true,
  #   uniqueness: true,
  #   length: { minimum: 2, maximum: 50 },
  #   format: { with: /[A-Za-z,0-9.-_]/ }

  # validates :acct_type,
  #   presence: true

  # validates :password_digest,
  #   presence: true,
  #   length: { minimum: 8, maximum: 30 },
  #   format: { with: /[A-Za-z0-9._]/ }

  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email,
  #   presence: true,
  #   length: { minimum: 8, maximum: 60 },
  #   format: { with: VALID_EMAIL_REGEX },
  #   uniqueness: { case_sensitive: false }


  # # Returns the hash digest of the given string.
  # def Member.digest(string)
  #   cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
  #                                                 BCrypt::Engine.cost
  #   BCrypt::Password.create(string, cost: cost)
  # end

  # # Returns a random token.
  # def Member.new_token
  #   SecureRandom.urlsafe_base64
  # end

  # def self.is_password?(password)
  #   BCrypt::Password.new(self.password_digest) == password
  # end
end
