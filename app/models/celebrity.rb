class Celebrity < ApplicationRecord

  belongs_to :user
  has_many :reservations
  has_one_attached :photo
  # debería existir la línea "has_many :reviews, through: :reservations"
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_name_and_description,
    against: [ :first_name, :last_name, :description, :address ],
    using: {
      tsearch: { prefix: true }
    }

end
