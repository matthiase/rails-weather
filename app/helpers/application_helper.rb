module ApplicationHelper
  def format_datetime(time)
    time.strftime('%b %d, %Y %I:%M %p')
  end

  def format_date(time)
    time.strftime(' %a, %b %d')
  end

  def format_time(time)
    time.strftime('%I:%M %p')
  end
end
