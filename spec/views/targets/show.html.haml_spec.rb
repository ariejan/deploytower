require 'spec_helper'

describe 'targets/show' do
  let(:target) { build_stubbed(:target, name: 'app-target') }

  before(:each) do
    assign(:target, target)
    assign(:deployments, [])
    render
  end

  it 'renders the target name' do
    expect(rendered).to have_content('app-target')
  end

  describe "with deployments" do
    let(:deployments) { build_stubbed_list :deployment, 2 }

    it 'shows a 0 deployments message' do
      render
      expect(rendered).to have_css('#deployments', text: 'no deployments')
    end

    it 'renders the deployment partial for each deployment' do
      assign(:deployments, deployments)
      render

      expect(rendered).to render_template(partial: 'deployments/_deployment', count: 2)
    end
  end
end
