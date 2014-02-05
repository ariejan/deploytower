require 'spec_helper'

describe 'partial flash_messages' do
  it 'renders success' do
    flash[:success] = 'Success message'
    render partial: 'shared/flash_messages'
    expect(rendered).to have_css('#flash_success', 'Success message')
  end

  it 'renders notices' do
    flash[:notice] = 'Notice message'
    render partial: 'shared/flash_messages'
    expect(rendered).to have_css('#flash_notice', 'Notice message')
  end

  it 'renders error' do
    flash[:error] = 'Error message'
    render partial: 'shared/flash_messages'
    expect(rendered).to have_css('#flash_error', 'Error message')
  end
end
