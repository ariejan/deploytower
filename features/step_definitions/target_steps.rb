Given(/^(\d+) targets? exists?$/) do |count|
  FactoryGirl.create_list(:target, count.to_i)
end

Given(/^a target "(.*?)" exists$/) do |name|
  FactoryGirl.create(:target, name: name)
end

Given(/^2 randomly ordered targets exist$/) do
  FactoryGirl.create(:target, name: 'zzzz')
  FactoryGirl.create(:target, name: 'aaaa')
end

When(/^I visit the target page$/) do
  visit '/'
end

When(/^I click on a target$/) do
  click_link Target.first.name
end

When(/^I add a new target named "(.*?)"$/) do |name|
  create_target(name: name)
end

When(/^I try to add an invalid target$/) do
  create_invalid_target
end

When(/^I update target "(.*?)" with invalid data$/) do |name|
  target = Target.find_by_name(name)
  update_invalid_target(target)
end

When(/^I update the target "(.*?)" to "(.*?)"$/) do |name, new_name|
  target = Target.find_by_name(name)
  update_target(target, name: new_name)
end

When(/^I destroy the target "(.*?)"$/) do |name|
  target = Target.where(name: name).first
  destroy_target(target)
end

Then(/^I should see no targets configured$/) do
  expect(page).to have_content('No targets configured')
end

Then(/^I should see all targets$/) do
  Target.find_each do |target|
    expect(page).to have_content(target.name)
  end
end

Then(/^I should be on the target detail page$/) do
  target = Target.first
  expect_target_details_page(target)
end

Then(/^I should be on the target detail page for "(.*?)"$/) do |name|
  target = Target.where(name: name).first
  expect_target_details_page(target)
end

Then(/^I should see errors on target$/) do
  expect(page).to have_selector('#error_explanation')
end

Then(/^I see all targets are sorted alphabetically$/) do
  targets = Target.order('name ASC')
  expect(targets.first.name).to appear_before(targets.last.name)
end

Then(/^I should see the target "(.*?)" no longer exists$/) do |name|
  expect(current_path).to eql('/')
  expect(page).to have_no_content(name)
end

Then(/^I see the target was (.*?) successfully$/) do |action|
  within('#flash_success') do
    expect(page).to have_content("Target was successfully #{action}")
  end
end
