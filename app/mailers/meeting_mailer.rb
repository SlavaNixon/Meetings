class MeetingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.meeting_mailer.subscription.subject
  #
  def subscription(meeting, subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @meeting = meeting

    mail to: meeting.user.email, subject: "Новая подписка на #{meeting.name}"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.meeting_mailer.comment.subject
  #
  def comment(meeting, comment, email)
    @comment = comment
    @meeting = meeting
  
    mail to: email, subject: "Новый комментарий у события #{meeting.name}"
  end
end
