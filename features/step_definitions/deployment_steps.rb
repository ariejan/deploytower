Given(/^a deployment is already queued$/) do
  create(:deployment, target: Target.last)
end

Given(/^I am on the target page$/) do
  visit "/targets/#{Target.last.id}"
end

Then(/^I see a list of previous deployments$/) do
  deployment = Target.last.deployments.last

  within("#deployment_#{deployment.id}") do
    expect(page).to have_content(deployment.branch)
  end
end
