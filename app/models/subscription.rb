class Subscription < ApplicationRecord
  belongs_to :meeting
  belongs_to :user, optional: true

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, unless: -> { user.present? }

  validates :user, uniqueness: {scope: :meeting_id}, if: -> { user.present? }
  validates :user_email, uniqueness: {scope: :meeting_id}, if: -> { user.present? }

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
