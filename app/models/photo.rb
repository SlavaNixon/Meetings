class Photo < ApplicationRecord
  belongs_to :meeting
  belongs_to :user

  mount_uploader :photo, PhotoUploader
end
