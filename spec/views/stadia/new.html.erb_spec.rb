require 'spec_helper'

describe "stadia/new" do
  before(:each) do
    assign(:stadium, stub_model(Stadium,
                                :name => "MyString",
                                :city => 1,
                                :capacity => 1
    ).as_new_record)
  end

  it "renders new stadium form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stadia_path, "post" do
      assert_select "input#stadium_name[name=?]", "stadium[name]"
      assert_select "input#stadium_city[name=?]", "stadium[city]"
      assert_select "input#stadium_capacity[name=?]", "stadium[capacity]"
    end
  end
end
