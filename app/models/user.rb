class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :profile, dependent: :destroy
  has_many :participants, dependent: :destroy
  validates :email, uniqueness: true

  def name
    "#{User.find(id).profile.first_name} #{User.find(id).profile.last_name}"
  end
end
