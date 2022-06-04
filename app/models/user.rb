class User < ApplicationRecord
  has_many :meeting, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_one_attached :image

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :nickname, length: { in: 4..21 }, presence: true, uniqueness: true, format: /\A[\w\sА-Яа-я]+\z/
  
  private

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end
end
