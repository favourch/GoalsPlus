require 'spec_helper'

describe "guesses/new" do
  before(:each) do
    assign(:guess, stub_model(Guess,
      :user => 1,
      :match => 1,
      :goals_a => 1,
      :goals_b => 1,
      :pens_a => 1,
      :pens_b => 1,
      :points => 1
    ).as_new_record)
  end

  it "renders new guess form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", guesses_path, "post" do
      assert_select "input#guess_user[name=?]", "guess[user]"
      assert_select "input#guess_match[name=?]", "guess[match]"
      assert_select "input#guess_goals_a[name=?]", "guess[goals_a]"
      assert_select "input#guess_goals_b[name=?]", "guess[goals_b]"
      assert_select "input#guess_pens_a[name=?]", "guess[pens_a]"
      assert_select "input#guess_pens_b[name=?]", "guess[pens_b]"
      assert_select "input#guess_points[name=?]", "guess[points]"
    end
  end
end
