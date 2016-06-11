class Member < ActiveRecord::Base
  has_secure_password
  # has_many :samples
  # :avatar, :first_name, :last_name, :email, :alter_ego, :password_digest, :location, :title, :education, :haiku, :fav_style_manual, :fav_rule, :acct_type

  attr_accessor :first_name, :alter_ego, :acct_type, :password_digest, :email

  before_save { self.email = email.downcase }

  validates :first_name,
    presence: true,
    format: { with: /[A-Za-z,0-9.-]/ }

  validates :alter_ego,
    presence: true,
    uniqueness: true,
    length: { minimum: 2, maximum: 50 },
    format: { with: /[A-Za-z,0-9.-_]/ }

  validates :acct_type,
    presence: true

  validates :password_digest,
    presence: true,
    length: { minimum: 8, maximum: 30 }
    # format: { with: /[A-Za-z0-9._]/ }

  validates :email,
    presence: true,
    length: { minimum: 8, maximum: 60 },
    format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ },
    uniqueness: { case_sensitive: false }
end
