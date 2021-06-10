class Review < ApplicationRecord
  belongs_to :reservation
  validates :rating, presence: true
  validates :content, presence: true
end
