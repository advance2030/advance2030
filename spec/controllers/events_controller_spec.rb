require 'spec_helper'

describe EventsController do

  context "#new" do

    before do
      get :new
    end

    subject { response }
    it { should be_success }
  end

end
