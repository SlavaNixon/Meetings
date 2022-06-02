class Meeting < ApplicationRecord
  # user = owner
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user
  has_many :photos

  validates :name, presence: true, length: { maximum: 28 }
  validates :place, presence: true, length: { maximum: 42 }
  validates :date, comparison: { greater_than: Time.now }
  validates :description, length: { maximum: 500 }

  def visitors
    [user] + subscribers
  end
end
