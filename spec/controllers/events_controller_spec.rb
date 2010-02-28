require 'spec_helper'

describe EventsController do

  context "#new" do

    before do
      get :new
    end

    subject { response }

    it { should be_success }
    it { should render_template("events/new") }

    it "routes correctly" do
      "/events/new".should route_to(:controller => "events", :action => "new")
    end

    it "has a new event" do
      assigns[:event].should_not be_nil
      assigns[:event].should be_new_record
    end

  end

end
