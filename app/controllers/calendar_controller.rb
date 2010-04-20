class CalendarController < ApplicationController
  before_filter :find_min_max

  def index
    @date = Time.local(params[:year], params[:month], params[:day])
    @months_events = Event.all_in_month(@date)
    @days_events = Event.all_in_day(@date)
  end
  
  def redirect
    # TODO: break these out into specific routes: by year, month_year, date, etc
    redirect_to calendar_url(
      :year => params[:date][:year],
      :month => params[:date][:month],
      :day => params[:date][:day]
    )
  end

  private
    def find_min_max
      @min = Event.min_start_date_time || Date.today
      @max = Event.max_end_date_time || @min
    end
end
