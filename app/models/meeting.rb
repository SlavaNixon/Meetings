class Meeting < ApplicationRecord
  # user = owner
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user

  validates :name, presence: true, length: { maximum: 40 }
  validates :place, presence: true, length: { maximum: 50 }
  validates :date, comparison: { greater_than: Time.now }
  validates :description, length: { maximum: 500 }
end
