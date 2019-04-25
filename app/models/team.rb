class Team < ApplicationRecord
  belongs_to :user
  has_many :participants, dependent: :destroy
  has_many :users, through: :participants, dependent: :nullify
  has_many :comments
  after_update :send_accepted_team_email, if: :status_accepted?
  after_update :send_denied_team_email, if: :status_denied?
  enum status: { pending: 0, accepted: 1, denied: 2, finished: 3 }
  enum gender: { male: 0, female: 1 }
  validates :name, presence: true, uniqueness: true

  scope :pending, -> { where(status: :pending) }
  scope :accepted, -> { where(status: :accepted) }
  scope :denied, -> { where(status: :denied) }

  private

  def name_with_captain
    "#{name} -  Capitaine #{Team.find(id).user.name}"
  end

  def send_accepted_team_email
    TeamMailer.creation_confirmation(id).deliver_now
  end

  def send_denied_team_email
    TeamMailer.creation_cancellation(id).deliver_now
  end

  def status_accepted?
    Team.find(id).status == "accepted"
  end

  def status_denied?
    Team.find(id).status == "denied"
  end
end
