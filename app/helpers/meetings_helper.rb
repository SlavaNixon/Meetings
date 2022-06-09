module MeetingsHelper
  def time_format(time)
    time.in_time_zone.strftime("%d.%m.%Y %H:%M")
  end
end
