module MeetingsHelper
  def time_format(time)
    time.strftime("%d.%m.%Y %H:%M")
  end
end
