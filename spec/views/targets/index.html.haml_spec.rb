require 'spec_helper'

describe 'targets/index' do
  before(:each) do
    assign(:targets, [
      build_stubbed(:target, name: 'app-target-1'),
      build_stubbed(:target, name: 'app-target-2')
    ])

    render
  end

  it 'renders list of targets' do
    expect(rendered).to have_content('app-target-1')
    expect(rendered).to have_content('app-target-2')
  end
end
