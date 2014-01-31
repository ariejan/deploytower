module Helpers
  module Targets
    def expect_target_details_page(target)
      expect(current_path).to eql("/targets/#{target.id}")
      expect(page).to have_content(target.name)
    end

    def create_target(opts)
      opts.symbolize_keys!
      attributes = FactoryGirl.attributes_for(:target).merge!(opts)

      visit "/targets/new"

      # Explicitly fill out the form
      fill_in "Name",               with: attributes[:name]
      fill_in "Heroku app name",    with: attributes[:heroku_app_name]
      fill_in "Heroku git remote",  with: attributes[:heroku_git_remote]
      fill_in "Git remote",         with: attributes[:git_remote]
      fill_in "Git default branch", with: attributes[:git_default_branch]
      fill_in "Url",                with: attributes[:url]

      save_and_open_page

      click_button "Create Target"
    end

    def update_target_name(old, new)
      target = Target.where(name: old).first

      visit "/targets/#{target.id}/edit"
      fill_in "Name", with: new
      click_button "Update Target"
    end

    def destroy_target(target)
      visit "/targets/#{target.id}"
      click_button "Delete"
    end
  end
end

World(Helpers::Targets)
