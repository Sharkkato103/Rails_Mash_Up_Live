require 'spec_helper'

describe "responses/edit.html.erb" do
  before(:each) do
    @response = assign(:response, stub_model(Response,
      :qid => 1,
      :body => "MyText"
    ))
  end

  it "renders the edit response form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => response_path(@response), :method => "post" do
      assert_select "input#response_qid", :name => "response[qid]"
      assert_select "textarea#response_body", :name => "response[body]"
    end
  end
end
