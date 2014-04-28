require 'spec_helper'

describe "teams/new" do
  before(:each) do
    assign(:team, stub_model(Team,
                             :name => "MyString",
                             :short => "MyString",
                             :stadium => 1,
                             :national => false,
                             :rating => 1
    ).as_new_record)
  end

  it "renders new team form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", teams_path, "post" do
      assert_select "input#team_name[name=?]", "team[name]"
      assert_select "input#team_short[name=?]", "team[short]"
      assert_select "input#team_stadium[name=?]", "team[stadium]"
      assert_select "input#team_national[name=?]", "team[national]"
      assert_select "input#team_rating[name=?]", "team[rating]"
    end
  end
end
