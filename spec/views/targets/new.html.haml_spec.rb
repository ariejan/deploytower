require 'spec_helper'

describe "targets/new" do
  before(:each) do
    assign(:target, Target.new)
    render
  end

  it "renders the targets form" do
    rendered.should have_selector("form[action='#{targets_path}']")
  end

  it "renders the target attribute fields" do
    # Use 'Name' vs. 'target_name'
    rendered.should have_field('Name')
    rendered.should have_field('Heroku app name')
    rendered.should have_field('Heroku git remote')
    rendered.should have_field('Git remote')
    rendered.should have_field('Git default branch')
    rendered.should have_field('Url')
  end

  it "renders a submit button" do
    rendered.should have_button('Create Target')
  end
end