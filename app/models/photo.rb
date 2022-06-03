class Photo < ApplicationRecord
  belongs_to :meeting
  belongs_to :user

  has_one_attached :photo
end
