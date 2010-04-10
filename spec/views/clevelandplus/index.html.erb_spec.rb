require 'spec_helper'

describe "/clevelandplus/index" do
  before(:each) do
    render 'clevelandplus/index'
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/clevelandplus/index])
  end
end
