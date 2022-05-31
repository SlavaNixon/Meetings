class User < ApplicationRecord
  has_many :meeting, dependent: :destroy
  has_many :comments, dependent: :destroy

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :nickname, length: { in: 4..21 }, presence: true, uniqueness: true

  private

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end
end
