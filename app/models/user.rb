class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_many :articles

  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 3, maximum: 25 }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { minimum: 3, maximum: 254 },
                    # Verify email with ruby's standard library regex.
                    format: { with: URI::MailTo::EMAIL_REGEXP }
end