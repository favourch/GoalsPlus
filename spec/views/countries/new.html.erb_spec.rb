require 'spec_helper'

describe "countries/new" do
  before(:each) do
    assign(:country, stub_model(Country,
      :name => "MyString",
      :code => "MyString",
      :continent => 1
    ).as_new_record)
  end

  it "renders new country form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", countries_path, "post" do
      assert_select "input#country_name[name=?]", "country[name]"
      assert_select "input#country_code[name=?]", "country[code]"
      assert_select "input#country_continent[name=?]", "country[continent]"
    end
  end
end
