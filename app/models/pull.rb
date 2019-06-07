class Pull < ApplicationRecord
  belongs_to :profile
  validates :gender, :size, :number, presence: true, allow_blank: false
  enum gender: { male: 0, female: 1 }
end
