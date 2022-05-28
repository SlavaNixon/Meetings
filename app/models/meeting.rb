class Meeting < ApplicationRecord
  # user = owner
  belongs_to :user

  validates :name, presence: true, length: { maximum: 40 }
  validates :place, presence: true, length: { maximum: 50 }
  validates :date, comparison: { greater_than: Time.now }
  validates :description, length: { maximum: 500 }
end
