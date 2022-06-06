module ApplicationHelper
  def user_avatar(user)
    if user.image.attached?
      user.image
    else
      asset_path('user.png')
    end
  end

  def user_thumb_avatar(user)
    user_avatar(user)
  end

  def meeting_photo(meeting)
    if meeting.photos.present?
      meeting.photos.sample.photo.url
    else
      asset_path('meet.jpg')
    end
  end

  def user_can_delete?(meeting_owner)
    current_user == @user || current_user == meeting_owner
  end
end
