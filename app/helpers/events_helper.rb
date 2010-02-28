module EventsHelper

  def venue_label_text
    %(Venue <span class="aside-label">(If you do not see your venue you can #{link_to_new_venue("add a new a venue here")})</span>)
  end

  def link_to_new_venue(text)
    link_to(text, new_venue_path)
  end

end
