module ApplicationHelper
  def user_avatar(user)
    if user.avatar?
      user.avatar.url
    else
      asset_path('user.png')
    end
  end

  def user_thumb_avatar(user)
    if user.avatar?
      user.avatar.thumb.url
    else
      asset_path('user.png')
    end
  end

  def meeting_photo(meeting)
    if meeting.photos.present?
      meeting.photos.sample.photo.url
    else
      asset_path('meet.jpg')
    end
  end
end
