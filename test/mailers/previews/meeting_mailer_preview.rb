# Preview all emails at http://localhost:3000/rails/mailers/meeting_mailer
class MeetingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/meeting_mailer/subscription
  def subscription
    MeetingMailer.subscription
  end

  # Preview this email at http://localhost:3000/rails/mailers/meeting_mailer/comment
  def comment
    MeetingMailer.comment
  end

end
