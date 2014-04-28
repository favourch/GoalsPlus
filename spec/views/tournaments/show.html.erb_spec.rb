require 'spec_helper'

describe "tournaments/show" do
  before(:each) do
    @tournament = assign(:tournament, stub_model(Tournament,
      :name => "Name",
      :short => "Short",
      :national => false,
      :club => false,
      :rating => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Short/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/1/)
  end
end
