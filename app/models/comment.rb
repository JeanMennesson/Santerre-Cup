class Comment < ApplicationRecord
  belongs_to :team
  validates :content, length: { minimum: 10 }
  validates :team, presence: true
end
