require "test_helper"

class MeetingMailerTest < ActionMailer::TestCase
  test "subscription" do
    mail = MeetingMailer.subscription
    assert_equal "Subscription", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "comment" do
    mail = MeetingMailer.comment
    assert_equal "Comment", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
