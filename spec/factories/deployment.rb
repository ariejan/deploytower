FactoryGirl.define do
  factory :deployment do
    target

    branch      { "master" }
    revision    { "69f4f22c4e6509e63542536b83271d4fe620bc1c" }

    started_at  { 90.minutes.ago }
    finished_at { 88.minutes.ago }

    state       { "finished" }
  end
end
