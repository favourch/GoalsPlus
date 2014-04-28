require 'spec_helper'

describe "teams/index" do
  before(:each) do
    assign(:teams, [
        stub_model(Team,
                   :name => "Name",
                   :short => "Short",
                   :stadium => 1,
                   :national => false,
                   :rating => 2
        ),
        stub_model(Team,
                   :name => "Name",
                   :short => "Short",
                   :stadium => 1,
                   :national => false,
                   :rating => 2
        )
    ])
  end

  it "renders a list of teams" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Short".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
