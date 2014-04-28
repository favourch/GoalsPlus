require 'spec_helper'

describe "continents/edit" do
  before(:each) do
    @continent = assign(:continent, stub_model(Continent,
                                               :name => "MyString",
                                               :code => "MyString",
                                               :federation => "MyString"
    ))
  end

  it "renders the edit continent form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", continent_path(@continent), "post" do
      assert_select "input#continent_name[name=?]", "continent[name]"
      assert_select "input#continent_code[name=?]", "continent[code]"
      assert_select "input#continent_federation[name=?]", "continent[federation]"
    end
  end
end
