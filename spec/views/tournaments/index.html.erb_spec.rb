require 'spec_helper'

describe "tournaments/index" do
  before(:each) do
    assign(:tournaments, [
      stub_model(Tournament,
        :name => "Name",
        :short => "Short",
        :national => false,
        :club => false,
        :rating => 1
      ),
      stub_model(Tournament,
        :name => "Name",
        :short => "Short",
        :national => false,
        :club => false,
        :rating => 1
      )
    ])
  end

  it "renders a list of tournaments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Short".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
