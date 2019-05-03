class Team < ApplicationRecord
  belongs_to :user
  has_many :participants, dependent: :destroy
  has_many :users, through: :participants, dependent: :nullify
  has_many :comments
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
end
