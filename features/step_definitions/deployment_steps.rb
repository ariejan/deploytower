Given(/^a deployment is already queued$/) do
  create(:deployment, target: Target.last)
end

Given(/^I am on the target page$/) do
  visit "/targets/#{Target.last.id}"
end

When(/^I click the deploy button$/) do
  click_link "Deploy"
end

Then(/^I see a list of previous deployments$/) do
  deployment = Target.last.deployments.last

  within("#deployment_#{deployment.id}") do
    expect(page).to have_content(deployment.branch)
  end
end

Then(/^I should see a new deployment queued$/) do
  deployment = Target.last.deployments.last
  expect(page).to have_css("#deployment_#{deployment.id}")
  expect(page).to have_css("#flash_success", text: "Deployment queued successfully")
end
