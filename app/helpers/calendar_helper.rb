module CalendarHelper
  def current_calendar_url
    current = Date.today
    calendar_url :year => current.year, :month => current.month, :day => current.day
  end
  
  def previous_calendar_url(date)
    previous = date.last_month
    calendar_url :year => previous.year, :month => previous.month, :day => previous.day
  end

  def next_calendar_url(date)
    nmonth = date.next_month
    calendar_url :year => nmonth.year, :month => nmonth.month, :day => nmonth.day
  end
end
