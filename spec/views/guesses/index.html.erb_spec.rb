require 'spec_helper'

describe "guesses/index" do
  before(:each) do
    assign(:guesses, [
      stub_model(Guess,
        :user => 1,
        :match => 2,
        :goals_a => 3,
        :goals_b => 4,
        :pens_a => 5,
        :pens_b => 6,
        :points => 7
      ),
      stub_model(Guess,
        :user => 1,
        :match => 2,
        :goals_a => 3,
        :goals_b => 4,
        :pens_a => 5,
        :pens_b => 6,
        :points => 7
      )
    ])
  end

  it "renders a list of guesses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
  end
end
