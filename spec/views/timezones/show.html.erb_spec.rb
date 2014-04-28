require 'spec_helper'

describe "timezones/show" do
  before(:each) do
    @timezone = assign(:timezone, stub_model(Timezone,
                                             :name => "Name",
                                             :tzinfo => "Tzinfo",
                                             :utc => "Utc"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Tzinfo/)
    rendered.should match(/Utc/)
  end
end
