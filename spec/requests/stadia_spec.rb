require 'spec_helper'

describe "Stadia" do
  describe "GET /stadia" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get stadia_path
      response.status.should be(200)
    end
  end
end
