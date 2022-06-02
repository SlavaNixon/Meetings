class Subscription < ApplicationRecord
  belongs_to :meeting
  belongs_to :user, optional: true

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, unless: -> { user.present? }

  validates :user_email, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/

  validates :user, uniqueness: {scope: :meeting_id}, if: -> { user.present? }
  validates :user_email, uniqueness: {scope: :meeting_id}, if: -> { user.present? }

  validates :user, comparison: { other_than: -> {meeting.user} }, if: -> { user.present? }
  validates :user_email, exclusion: { in: User.pluck(:email) }, unless: -> { user.present? }
  validates :user_name, exclusion: { in: User.pluck(:nickname) }, unless: -> { user.present? }
  
  # Если есть юзер, выдаем его имя,
  # если нет – дергаем исходный метод
  def user_name
    if user.present?
    user.name
    else
    super
    end
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
      user.name
    else
      super
    end
  end
end
