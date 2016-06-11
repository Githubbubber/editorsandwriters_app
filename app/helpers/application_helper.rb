module ApplicationHelper
  def self.password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.is_password?(password)
    BCrypt::Password.new(self.password_digest) == password
  end
end
