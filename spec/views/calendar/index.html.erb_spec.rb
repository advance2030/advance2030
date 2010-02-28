require 'spec_helper'

describe "/calendar/index" do
  before(:each) do
    render 'calendar/index'
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('table#calendar')
  end
end
