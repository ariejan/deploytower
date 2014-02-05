require 'spec_helper'

describe 'targets/show' do
  let(:target) { build_stubbed(:target, name: 'app-target') }

  before(:each) do
    assign(:target, target)
    assign(:deployments, [])
  end

  it 'renders the target name' do
    render
    expect(rendered).to have_content('app-target')
  end

  it 'render a deploy button' do
    render
    expect(rendered).to have_link('Deploy')
  end

  describe 'with deployments' do
    let(:deployments) { build_stubbed_list :deployment, 2 }

    it 'shows a 0 deployments message' do
      render
      expect(rendered).to have_css('#deployments', text: 'no deployments')
    end

    it 'renders the deployment partial for each deployment' do
      assign(:deployments, deployments)
      render

      expect(rendered).to render_template(
        partial: 'deployments/_deployment', count: 2)
    end
  end

  describe 'with queued deployment' do
    before do
      allow(target).to receive(:deployable?).and_return(false)
    end

    it 'disables the Deploy button' do
      render
      expect(rendered).not_to have_link('Deploy')
      expect(rendered).to have_css('.btn.disabled', text: 'Deploy')
    end
  end
end
