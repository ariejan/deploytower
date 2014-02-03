require 'spec_helper'

describe Target do

  it "generates a valid Target" do
    expect(create(:target)).to be_valid
  end

  context "validations" do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:heroku_app_name) }
    it { expect(subject).to validate_presence_of(:heroku_git_remote) }
    it { expect(subject).to validate_presence_of(:git_remote) }
    it { expect(subject).to validate_presence_of(:git_default_branch) }
    it { expect(subject).to validate_presence_of(:url) }
  end

  context "default scope" do
    let!(:z) { create :target, name: "zzzz" }
    let!(:a) { create :target, name: "aaaa" }

    it "orders 'name ASC'" do
      expect(Target.all.to_a).to eql([a, z])
    end
  end
end
