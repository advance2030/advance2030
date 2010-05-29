# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def current_link(name, options={}, html_options={})
    if current_page?(options)
      link_to(name, options, html_options.merge({:class => 'current'}))
    else
      link_to(name, options, html_options)
    end
  end
  
  
end
