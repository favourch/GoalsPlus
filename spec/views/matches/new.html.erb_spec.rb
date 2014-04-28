require 'spec_helper'

describe "matches/new" do
  before(:each) do
    assign(:match, stub_model(Match,
                              :team_a => 1,
                              :team_b => 1,
                              :stadium => 1,
                              :tournament => 1,
                              :stage => 1,
                              :timezone => 1,
                              :pens => false,
                              :goals_a => 1,
                              :goals_b => 1,
                              :pens_a => 1,
                              :pens_b => 1,
                              :coof_a => "9.99",
                              :coof_x => "9.99",
                              :coof_b => "9.99"
    ).as_new_record)
  end

  it "renders new match form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", matches_path, "post" do
      assert_select "input#match_team_a[name=?]", "match[team_a]"
      assert_select "input#match_team_b[name=?]", "match[team_b]"
      assert_select "input#match_stadium[name=?]", "match[stadium]"
      assert_select "input#match_tournament[name=?]", "match[tournament]"
      assert_select "input#match_stage[name=?]", "match[stage]"
      assert_select "input#match_timezone[name=?]", "match[timezone]"
      assert_select "input#match_pens[name=?]", "match[pens]"
      assert_select "input#match_goals_a[name=?]", "match[goals_a]"
      assert_select "input#match_goals_b[name=?]", "match[goals_b]"
      assert_select "input#match_pens_a[name=?]", "match[pens_a]"
      assert_select "input#match_pens_b[name=?]", "match[pens_b]"
      assert_select "input#match_coof_a[name=?]", "match[coof_a]"
      assert_select "input#match_coof_x[name=?]", "match[coof_x]"
      assert_select "input#match_coof_b[name=?]", "match[coof_b]"
    end
  end
end
