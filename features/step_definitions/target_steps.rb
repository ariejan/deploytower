Given(/^(\d+) targets exist$/) do |count|
  FactoryGirl.create_list(:target, count.to_i)
end

When(/^I visit the target page$/) do
  visit "/"
end

Then(/^I should see no targets configured$/) do
  expect(page).to have_content("No targets configured")
end
