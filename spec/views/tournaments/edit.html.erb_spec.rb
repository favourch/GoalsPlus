require 'spec_helper'

describe "tournaments/edit" do
  before(:each) do
    @tournament = assign(:tournament, stub_model(Tournament,
                                                 :name => "MyString",
                                                 :short => "MyString",
                                                 :national => false,
                                                 :club => false,
                                                 :rating => 1
    ))
  end

  it "renders the edit tournament form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tournament_path(@tournament), "post" do
      assert_select "input#tournament_name[name=?]", "tournament[name]"
      assert_select "input#tournament_short[name=?]", "tournament[short]"
      assert_select "input#tournament_national[name=?]", "tournament[national]"
      assert_select "input#tournament_club[name=?]", "tournament[club]"
      assert_select "input#tournament_rating[name=?]", "tournament[rating]"
    end
  end
end
