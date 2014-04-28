require 'spec_helper'

describe "timezones/index" do
  before(:each) do
    assign(:timezones, [
        stub_model(Timezone,
                   :name => "Name",
                   :tzinfo => "Tzinfo",
                   :utc => "Utc"
        ),
        stub_model(Timezone,
                   :name => "Name",
                   :tzinfo => "Tzinfo",
                   :utc => "Utc"
        )
    ])
  end

  it "renders a list of timezones" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Tzinfo".to_s, :count => 2
    assert_select "tr>td", :text => "Utc".to_s, :count => 2
  end
end
