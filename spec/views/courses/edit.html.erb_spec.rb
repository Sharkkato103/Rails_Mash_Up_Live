require 'spec_helper'

describe "courses/edit.html.erb" do
  before(:each) do
    @course = assign(:course, stub_model(Course,
      :id => 1,
      :title => "MyString",
      :professor => "MyString"
    ))
  end

  it "renders the edit course form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => course_path(@course), :method => "post" do
      assert_select "input#course_id", :name => "course[id]"
      assert_select "input#course_title", :name => "course[title]"
      assert_select "input#course_professor", :name => "course[professor]"
    end
  end
end
