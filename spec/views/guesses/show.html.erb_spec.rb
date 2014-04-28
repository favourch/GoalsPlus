require 'spec_helper'

describe "guesses/show" do
  before(:each) do
    @guess = assign(:guess, stub_model(Guess,
                                       :user => 1,
                                       :match => 2,
                                       :goals_a => 3,
                                       :goals_b => 4,
                                       :pens_a => 5,
                                       :pens_b => 6,
                                       :points => 7
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
    rendered.should match(/7/)
  end
end
