require 'spec_helper'

describe "cities/show" do
  before(:each) do
    @city = assign(:city, stub_model(City,
      :name => "Name",
      :timezone => 1,
      :country => 2
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
