class Photo < ApplicationRecord
  belongs_to :meeting
  belongs_to :user

  has_one_attached :photo

  validate :acceptable_image

  private

  def acceptable_image
    acceptable_types = ["image/jpg", "image/jpeg", "image/png"]
    unless acceptable_types.include?(photo.content_type)
      errors.add(:photo, "must be a JPG, JPEG or PNG")
    end
  end
end
