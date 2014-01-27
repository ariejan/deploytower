Given(/^(\d+) targets? exists?$/) do |count|
  FactoryGirl.create_list(:target, count.to_i)
end

When(/^I visit the target page$/) do
  visit "/"
end

When(/^I click on a target$/) do
  click_link Target.first.name
end

When(/^I add a new target named "(.*?)"$/) do |name|
  create_target_with_name(name)
end

Then(/^I should see no targets configured$/) do
  expect(page).to have_content("No targets configured")
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
