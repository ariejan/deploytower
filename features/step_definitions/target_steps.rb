Given(/^(\d+) targets? exists?$/) do |count|
  FactoryGirl.create_list(:target, count.to_i)
end

Given(/^no targets exist$/) do
  step "0 targets exist"
end

Given(/^a target "(.*?)" exists$/) do |name|
  FactoryGirl.create(:target, name: name)
end

Given(/^2 randomly ordered targets exist$/) do
  FactoryGirl.create(:target, name: "zzzz")
  FactoryGirl.create(:target, name: "aaaa")
end

When(/^I visit the target page$/) do
  visit "/"
end

When(/^I click on a target$/) do
  click_link Target.first.name
end

When(/^I add a new target named "(.*?)"$/) do |name|
  create_target(name: name)
end

When(/^I add a new target without attribute "(.*?)"$/) do |attribute|
  create_target(attribute => "")
end

When(/^I update the name of "(.*?)" to "(.*?)"$/) do |old, new|
  update_target_name(old, new)
end

When(/^I destroy the target "(.*?)"$/) do |name|
  target = Target.where(name: name).first
  destroy_target(target)
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
  puts Target.all.inspect
  target = Target.where(name: name).first
  expect_target_details_page(target)
end

Then(/^I should see target "(.*?)" cannot be blank$/) do |attribute|
  within("#error_explanation") do
    expect(page).to have_content("#{attribute.humanize} can't be blank")
  end
end

Then(/^I see all targets are sorted alphabetically$/) do
  targets = Target.order("name ASC")
  expect(targets.first.name).to appear_before(targets.last.name)
end

Then(/^I should see "(.*?)" in the overview$/) do |name|
  visit "/"
  within("#targets") do
    expect(page).to have_content(name)
  end
end

Then(/^I should see the target "(.*?)" no longer exists$/) do |name|
  expect(current_path).to eql("/")
  expect(page).to have_no_content(name)
end
