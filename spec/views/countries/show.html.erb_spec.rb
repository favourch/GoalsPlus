require 'spec_helper'

describe "countries/show" do
  before(:each) do
    @country = assign(:country, stub_model(Country,
                                           :name => "Name",
                                           :code => "Code",
                                           :continent => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Code/)
    rendered.should match(/1/)
  end
end
