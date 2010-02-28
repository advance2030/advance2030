module CalendarHelper
  def current_calendar_url
    current = Time.now
    calendar_url :year => current.year, :month => current.month, :day => current.day
  end
end
