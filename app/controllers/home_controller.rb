class HomeController < ApplicationController

  def index
    @date = get_date
    @months_events = Event.all_in_month(@date)
  end

  private
    def get_date
      begin
        Time.local(params[:year], params[:month], 1)
      rescue Exception => e
        Time.now
      end
    end
end
