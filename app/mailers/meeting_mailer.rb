class MeetingMailer < ApplicationMailer
  def subscription(subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @meeting = subscription.meeting

    mail to: @meeting.user.email, subject: "#{t "my.mailers.subscription.subject"} #{@meeting.name}"
  end

  def comment(comment, email)
    @comment = comment
    @meeting = comment.meeting
  
    mail to: email, subject: "#{t "my.mailers.comment.subject"} #{@meeting.name}"
  end

  def photo(photo, email)
    @photo = photo
    @meeting = photo.meeting
  
    mail to: email, subject: "#{t "my.mailers.photo.subject"} #{@meeting.name}"
  end
end
