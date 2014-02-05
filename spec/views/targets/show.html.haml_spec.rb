require 'spec_helper'

describe "targets/show" do
  before(:each) do
    assign(:target, build_stubbed(:target, name: "app-target"))
    render
  end

  it "renders the target name" do
    expect(rendered).to have_content("app-target")
  end
end
