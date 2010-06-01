Then /^I should see a link with the text "([^\"]*)"$/ do |text|
  link = find_link(text)
  raise "Link with the text \"#{text}\" was not found in the page" if (link == nil)

  link.visible?
end

