module Helpers
  module Targets
    def expect_target_details_page(target)
      expect(current_path).to eql("/targets/#{target.id}")
      expect(page).to have_content(target.name)
    end

    def create_target_with_name(name)
      visit "/targets/new"

      fill_in "Name", with: name
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
