Given(/^(\d+) targets exist$/) do |count|
  FactoryGirl.create_list(:target, count.to_i)
end

When(/^I visit the target page$/) do
  visit "/"
end

Then(/^I should see no targets configured$/) do
  expect(page).to have_content("No targets configured")
end

Then(/^I should see all targets$/) do
  Target.find_each do |target|
    expect(page).to have_content(target.name)
  end
end
