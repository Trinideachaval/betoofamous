class Celebrity < ApplicationRecord

  belongs_to :user
  has_many :reservations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :photo_url, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_name_and_description,
    against: [ :first_name, :last_name, :description, :address ],
    using: {
      tsearch: { prefix: true }
    }

end
