module CalendarHelper
  def calendar_day_url(date, args = {})
    options = {:year => date.year, :month => date.month, :day => date.day}.merge!(args)
    calendar_url options
  end
  def current_calendar_url
    calendar_day_url(Date.today)
  end
  
  def previous_calendar_url(date)
    calendar_day_url(date.last_month)
  end

  def next_calendar_url(date)
    calendar_day_url(date.next_month)
  end

  def render_calendar(date, events, args = {})
    mini = args[:mini].nil? ? false : args[:mini];

  	calendar_for(events,
  		:year => date.year,
  		:month => date.month,
  		:day => date.day,
  		:html => {
  			:id => 'calendar',
  			:cellpadding => 0,
  			:cellspacing => 0
  		}
  	) do |c|
  	  if mini
        concat "<thead><tr>"
        concat "<th>" + link_to("&lsaquo;", root_url(:month => date.last_month.month, :year => date.last_month.year), :class => 'leftArrow') + "</th>"
        concat "<th colspan=\"5\">" + date.strftime('%B %Y') + "</th>"
        concat "<th>" + link_to("&rsaquo;", root_url(:month => date.next_month.month, :year => date.next_month.year), :class => 'rightArrow') + "</th>"
        concat "</tr></thead>"
	    else
        concat c.head(*Date::DAYNAMES)
      end

	    c.day :day_method => :start_datetime do |day, events|
  		  concat "<div class=\"label\">#{day.day}</div>"
  		    
		    if !mini
  			  concat "<ul class=\"events\">"

    			events.each do |event|
    				concat "<li><span class=""></span>"
    					concat link_to(truncate(event.name, :length=>50), event_detail_url(event), :title => event.name)
    				concat "</li>"
    			end
    		end	

			  concat "</ul>"
      end
	  end
  end
end
