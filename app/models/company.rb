class Company < ApplicationRecord
  has_many :users

  before_validation do
    set_token
  end

  validates :name, {
    presence: true,
    length: { in: 2..250 }
  }

  validates :token, {
    presence: true,
    uniqueness: true
  }

  private

  def set_token
    self.token ||= SecureRandom.uuid
  end
end
