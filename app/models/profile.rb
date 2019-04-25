class Profile < ApplicationRecord
  belongs_to :user
  enum role: { player: 1, captain: 2, spectator: 3 }
  enum gender: { male: 0, female: 1 }
  enum status: %i[inactive active pending denied]
  validates :first_name, :last_name, :gender, :phone_number, :role, :party, presence: true, allow_blank: false
  validates :phone_number, format: { with: /\A(?:(?:\+|00)33|0)\s*[6-7](?:[\s.-]*\d{2}){4}\z/, message: "Format incorrect, vérifie que tu aies rentré le bon numéro" }

  scope :role, -> { where(captain: true) }
  scope :role, -> { where(player: true) }
  scope :role, -> { where(spectator: true) }
  scope :party, -> { where(party: true) }

  private

  def send_welcome_email
    ProfileMailer.welcome(self).deliver_now
  end

  def email
    "#{Profile.find(id).user.email}"
  end

  def name
    "#{first_name} #{last_name}"
  end

  def admin
    "#{Profile.find(id).user.admin}"
  end
end
