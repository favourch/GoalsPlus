require 'spec_helper'

describe "tournaments/new" do
  before(:each) do
    assign(:tournament, stub_model(Tournament,
                                   :name => "MyString",
                                   :short => "MyString",
                                   :national => false,
                                   :club => false,
                                   :rating => 1
    ).as_new_record)
  end

  it "renders new tournament form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tournaments_path, "post" do
      assert_select "input#tournament_name[name=?]", "tournament[name]"
      assert_select "input#tournament_short[name=?]", "tournament[short]"
      assert_select "input#tournament_national[name=?]", "tournament[national]"
      assert_select "input#tournament_club[name=?]", "tournament[club]"
      assert_select "input#tournament_rating[name=?]", "tournament[rating]"
    end
  end
end
