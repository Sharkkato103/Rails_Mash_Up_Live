require 'spec_helper'

describe "responses/show.html.erb" do
  before(:each) do
    @response = assign(:response, stub_model(Response,
      :qid => 1,
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
