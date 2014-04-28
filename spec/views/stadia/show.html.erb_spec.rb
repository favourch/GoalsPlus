require 'spec_helper'

describe "stadia/show" do
  before(:each) do
    @stadium = assign(:stadium, stub_model(Stadium,
      :name => "Name",
      :city => 1,
      :capacity => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
