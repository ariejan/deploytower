require 'spec_helper'

describe "targets/new" do
  let(:target) { build_stubbed(:target) }

  before(:each) do
    assign(:target, target)
    render
  end

  it "renders the targets form" do
    rendered.should have_selector("form[action='#{target_path(target)}']")

    # Use 'Name' vs. 'target_name'
    rendered.should have_field('Name')
    rendered.should have_field('Heroku app name')
    rendered.should have_field('Heroku git remote')
    rendered.should have_field('Git remote')
    rendered.should have_field('Git default branch')
    rendered.should have_field('Url')

    rendered.should have_button('Update Target')
  end
end

