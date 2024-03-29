class Photo < ApplicationRecord
  belongs_to :meeting
  belongs_to :user

  has_one_attached :photo

  validates :photo, attached: true, content_type: %w[image/jpg image/jpeg image/png], size: { less_than: 2.megabytes }
end
