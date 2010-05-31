module EventsHelper

  def venue_label_text
    %(Venue <span class="aside-label">(Don't see your venue?<br> #{link_to_new_venue("Add a new a venue here")})</span>)
  end

  def tag_list_label_text
    %(Tag List <span class="aside-label">(separate tags with commas)</span>)
  end

  def link_to_new_venue(text)
    link_to(text, new_venue_path)
  end

end
