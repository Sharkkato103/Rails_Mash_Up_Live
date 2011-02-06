require 'spec_helper'

describe "courses/show.html.erb" do
  before(:each) do
    @course = assign(:course, stub_model(Course,
      :id => 1,
      :title => "Title",
      :professor => "Professor"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Professor/)
  end
end
