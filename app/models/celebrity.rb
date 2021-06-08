class Celebrity < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :description, presence: true
  validates :photo_url, presence: true
end
