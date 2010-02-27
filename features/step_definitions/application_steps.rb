Then /^I should see a link with the text "([^\"]*)"$/ do |text|
  find_link(text).visible?
end
