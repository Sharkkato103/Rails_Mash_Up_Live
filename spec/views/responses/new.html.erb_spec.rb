require 'spec_helper'

describe "responses/new.html.erb" do
  before(:each) do
    assign(:response, stub_model(Response,
      :qid => 1,
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new response form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => responses_path, :method => "post" do
      assert_select "input#response_qid", :name => "response[qid]"
      assert_select "textarea#response_body", :name => "response[body]"
    end
  end
end
