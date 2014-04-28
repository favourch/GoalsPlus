require 'spec_helper'

describe "stadia/edit" do
  before(:each) do
    @stadium = assign(:stadium, stub_model(Stadium,
                                           :name => "MyString",
                                           :city => 1,
                                           :capacity => 1
    ))
  end

  it "renders the edit stadium form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stadium_path(@stadium), "post" do
      assert_select "input#stadium_name[name=?]", "stadium[name]"
      assert_select "input#stadium_city[name=?]", "stadium[city]"
      assert_select "input#stadium_capacity[name=?]", "stadium[capacity]"
    end
  end
end
