require 'spec_helper'

describe "stadia/index" do
  before(:each) do
    assign(:stadia, [
      stub_model(Stadium,
        :name => "Name",
        :city => 1,
        :capacity => 2
      ),
      stub_model(Stadium,
        :name => "Name",
        :city => 1,
        :capacity => 2
      )
    ])
  end

  it "renders a list of stadia" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
