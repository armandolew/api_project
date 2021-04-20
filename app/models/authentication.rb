class Authentication < ApplicationRecord
  belongs_to :user

  scope :active, -> { where(active: true) }

  before_validation do
    binding.pry
    disable_previous_authentications
    set_token
  end

  validates :token, {
    presence: true,
    uniqueness: true
  }

  private

  def disable_previous_authentications
    return unless self.user.authentications.any?
    self.user.authentications.update_all(active: false)
  end

  def set_token
    self.token ||= SecureRandom.uuid
  end
end
