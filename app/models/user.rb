class User < ApplicationRecord
  has_secure_password

  belongs_to :company
  has_many :authentications

  validates :first_name, {
    presence: true,
    length: { in: 2..250 }
  }

  validates :last_name, {
    presence: true,
    length: { in: 2..250 }
  }

  validates :email, {
    presence: true,
    uniqueness: true
  }
end
