class User < ApplicationRecord
  has_many :meeting, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_one_attached :image

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :nickname, length: { in: 4..21 }, presence: true, uniqueness: true, format: /\A[\w\sА-Яа-я]+\z/
  
  validate :acceptable_image, on: :update_user

  private

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def acceptable_image
    acceptable_types = ["image/jpg", "image/jpeg", "image/png"]
    unless acceptable_types.include?(image.content_type)
      errors.add(:image, "must be a JPG, JPEG or PNG")
    end
  end
end
