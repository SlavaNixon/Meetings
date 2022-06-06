class MeetingMailer < ApplicationMailer
  def subscription(meeting, subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @meeting = meeting

    mail to: meeting.user.email, subject: "#{t "my.mailers.subscription.subject"} #{meeting.name}"
  end

  def comment(meeting, comment, email)
    @comment = comment
    @meeting = meeting
  
    mail to: email, subject: "#{t "my.mailers.comment.subject"} #{meeting.name}"
  end

  def photo(meeting, photo, email)
    @photo = photo
    @meeting = meeting
  
    mail to: email, subject: "#{t "my.mailers.photo.subject"} #{meeting.name}"
  end
end
