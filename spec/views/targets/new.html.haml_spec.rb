require 'spec_helper'

describe 'targets/new' do
  before(:each) do
    assign(:target, Target.new)
    render
  end

  it 'renders the targets form' do
    expect(rendered).to have_selector("form[action='#{targets_path}']")
  end

  %w(name heroku_app_name heroku_git_remote
     git_remote git_default_branch url).each do |attr|
    it "render field for attribute ':#{attr}'" do
      expect(rendered).to have_field("target_#{attr}")
    end
  end

  it 'renders a submit button' do
    expect(rendered).to have_button('Create Target')
  end
end
