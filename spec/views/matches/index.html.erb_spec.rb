require 'spec_helper'

describe "matches/index" do
  before(:each) do
    assign(:matches, [
        stub_model(Match,
                   :team_a => 1,
                   :team_b => 2,
                   :stadium => 3,
                   :tournament => 4,
                   :stage => 5,
                   :timezone => 6,
                   :pens => false,
                   :goals_a => 7,
                   :goals_b => 8,
                   :pens_a => 9,
                   :pens_b => 10,
                   :coof_a => "9.99",
                   :coof_x => "9.99",
                   :coof_b => "9.99"
        ),
        stub_model(Match,
                   :team_a => 1,
                   :team_b => 2,
                   :stadium => 3,
                   :tournament => 4,
                   :stage => 5,
                   :timezone => 6,
                   :pens => false,
                   :goals_a => 7,
                   :goals_b => 8,
                   :pens_a => 9,
                   :pens_b => 10,
                   :coof_a => "9.99",
                   :coof_x => "9.99",
                   :coof_b => "9.99"
        )
    ])
  end

  it "renders a list of matches" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
