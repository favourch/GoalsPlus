require 'spec_helper'

describe "timezones/edit" do
  before(:each) do
    @timezone = assign(:timezone, stub_model(Timezone,
      :name => "MyString",
      :tzinfo => "MyString",
      :utc => "MyString"
    ))
  end

  it "renders the edit timezone form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", timezone_path(@timezone), "post" do
      assert_select "input#timezone_name[name=?]", "timezone[name]"
      assert_select "input#timezone_tzinfo[name=?]", "timezone[tzinfo]"
      assert_select "input#timezone_utc[name=?]", "timezone[utc]"
    end
  end
end
