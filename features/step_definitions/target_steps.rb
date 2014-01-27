Given(/^(\d+) targets? exists?$/) do |count|
  FactoryGirl.create_list(:target, count.to_i)
end

When(/^I visit the target page$/) do
  visit "/"
end

When(/^I click on a target$/) do
  click_link Target.first.name
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
  expect(current_path).to eql("/targets/#{target.id}")
  expect(page).to have_content(target.name)
end
