class Subscription < ApplicationRecord
  belongs_to :meeting
  belongs_to :user, optional: true

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, unless: -> { user.present? }

  validates :user_email, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/

  validates :user, uniqueness: {scope: :meeting_id}, if: -> { user.present? }
  validates :user_email, uniqueness: {scope: :meeting_id}, if: -> { user.present? }

  validate :user_is_owner, if: -> { user.present? }
  validate :email_already_exitst, unless: -> { user.present? }
  
  def user_is_owner
    errors.add(:user, "is owner") if user == meeting.user
  end

  def email_already_exitst
    errors.add(:user_email, "already exists") if User.exists?(email: user_email)
  end

  # Если есть юзер, выдаем его email,
  # если нет – дергаем исходный метод
  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  def user_name
    if user.present?
      user.nickname
    else
      super
    end
  end
end
