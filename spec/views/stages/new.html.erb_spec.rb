require 'spec_helper'

describe "stages/new" do
  before(:each) do
    assign(:stage, stub_model(Stage,
                              :name => "MyString"
    ).as_new_record)
  end

  it "renders new stage form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stages_path, "post" do
      assert_select "input#stage_name[name=?]", "stage[name]"
    end
  end
end
