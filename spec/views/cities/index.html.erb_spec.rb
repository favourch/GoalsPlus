require 'spec_helper'

describe "cities/index" do
  before(:each) do
    assign(:cities, [
        stub_model(City,
                   :name => "Name",
                   :timezone => 1,
                   :country => 2
        ),
        stub_model(City,
                   :name => "Name",
                   :timezone => 1,
                   :country => 2
        )
    ])
  end

  it "renders a list of cities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
