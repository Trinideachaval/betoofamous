class Celebrity < ApplicationRecord

  belongs_to :user
  has_many :reservations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :description, presence: true
  validates :photo_url, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_first_name_last_name_and_city,
    against: [ :first_name, :last_name, :city ],
    using: {
      tsearch: { prefix: true }
    }

end
