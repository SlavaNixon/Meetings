class Meeting < ApplicationRecord
  # user = owner
  belongs_to :user
end
