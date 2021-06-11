class Reservation < ApplicationRecord
  STATUS = %w(confirmed pending)
  belongs_to :user
  belongs_to :celebrity
  has_one :review, dependent: :destroy
  validates :reserve_begin, presence: true
  validates :reserve_end, presence: true
  validates :status, inclusion: { in: STATUS }
end
