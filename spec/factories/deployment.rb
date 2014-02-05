FactoryGirl.define do
  factory :deployment do
    target

    branch      { "master" }
    revision    { "69f4f22c4e6509e63542536b83271d4fe620bc1c" }

    started_at  nil
    finished_at nil

    state       { "queued" }

    factory :queued_deployment do
    end

    factory :finished_deployment do
      started_at  { 10.minutes.ago }
      finished_at {  7.minutes.ago }
      state       { "finished" }
    end
  end
end
