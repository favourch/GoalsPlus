require 'spec_helper'

describe "matches/show" do
  before(:each) do
    @match = assign(:match, stub_model(Match,
                                       :host => 1,
                                       :visitor => 2,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/6/)
    rendered.should match(/false/)
    rendered.should match(/7/)
    rendered.should match(/8/)
    rendered.should match(/9/)
    rendered.should match(/10/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
  end
end
