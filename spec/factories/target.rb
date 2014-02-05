FactoryGirl.define do
  sequence(:heroku_app_name)          { |n| "heroku_app_#{n}" }

  factory :target do
    name               { heroku_app_name.humanize }
    heroku_app_name
    heroku_git_remote  { "git@example.com:#{heroku_app_name}.git" }
    git_remote         { "git@git.example.org:apps/#{heroku_app_name}" }
    git_default_branch { 'master' }
    url                { "http://#{heroku_app_name}.example.com" }
  end
end
