require 'spec_helper'

describe 'deployment partial' do
  let(:deployment) { build_stubbed(:deployment) }

  before do
    render 'deployments/deployment', deployment: deployment
  end

  it 'renders proper class/id container' do
    expect(rendered).to have_css('.deployment')
    expect(rendered).to have_css("#deployment_#{deployment.id}")
  end

  it 'renders the branch name' do
    expect(rendered).to have_css('.branch', text: 'master')
  end

  it 'renders the git commit hash' do
    expect(rendered).to have_css('.revision',
      text: '69f4f22c4e6509e63542536b83271d4fe620bc1c')
  end

  it 'renders the state' do
    expect(rendered).to have_css('.state',
      text: 'queued')
  end
end
