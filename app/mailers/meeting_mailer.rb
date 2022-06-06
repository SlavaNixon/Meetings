class MeetingMailer < ApplicationMailer
  def subscription(meeting, subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @meeting = meeting

    mail to: meeting.user.email, subject: "Новая подписка на #{meeting.name}"
  end

  def comment(meeting, comment, email)
    @comment = comment
    @meeting = meeting
  
    mail to: email, subject: "Новый комментарий у события #{meeting.name}"
  end

  def photo(meeting, photo, email)
    @photo = photo
    @meeting = meeting
  
    mail to: email, subject: "Новая фотография у события #{meeting.name}"
  end
end
