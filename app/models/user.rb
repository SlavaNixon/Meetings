class User < ApplicationRecord
  has_many :meeting
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :nickname, length: { in: 4..21 }, presence: true, uniqueness: true
end
