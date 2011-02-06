require 'spec_helper'

describe "courses/index.html.erb" do
  before(:each) do
    assign(:courses, [
      stub_model(Course,
        :id => 1,
        :title => "Title",
        :professor => "Professor"
      ),
      stub_model(Course,
        :id => 1,
        :title => "Title",
        :professor => "Professor"
      )
    ])
  end

  it "renders a list of courses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Professor".to_s, :count => 2
  end
end
