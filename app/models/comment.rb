class Comment < ApplicationRecord
  belongs_to :meeting
  belongs_to :user, optional: true
end
