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

    it "has a presenter" do
      controller.should respond_to(:presenter)
      controller.presenter.should be_an_instance_of(Presenters::EventForm)
    end

    it "gives the view access to the presenter" do
      response.template.should respond_to(:presenter)
    end

  end

end
