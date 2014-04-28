require 'spec_helper'

describe "timezones/new" do
  before(:each) do
    assign(:timezone, stub_model(Timezone,
                                 :name => "MyString",
                                 :tzinfo => "MyString",
                                 :utc => "MyString"
    ).as_new_record)
  end

  it "renders new timezone form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", timezones_path, "post" do
      assert_select "input#timezone_name[name=?]", "timezone[name]"
      assert_select "input#timezone_tzinfo[name=?]", "timezone[tzinfo]"
      assert_select "input#timezone_utc[name=?]", "timezone[utc]"
    end
  end
end
