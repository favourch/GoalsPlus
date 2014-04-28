require 'spec_helper'

describe "countries/edit" do
  before(:each) do
    @country = assign(:country, stub_model(Country,
      :name => "MyString",
      :code => "MyString",
      :continent => 1
    ))
  end

  it "renders the edit country form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", country_path(@country), "post" do
      assert_select "input#country_name[name=?]", "country[name]"
      assert_select "input#country_code[name=?]", "country[code]"
      assert_select "input#country_continent[name=?]", "country[continent]"
    end
  end
end
