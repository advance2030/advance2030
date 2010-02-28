class CalendarController < ApplicationController
  def index
    @date = Time.local(params[:year], params[:month], params[:day])
    @days = Date::DAYNAMES
    @events = []
  end
end
