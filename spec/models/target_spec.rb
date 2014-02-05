require 'spec_helper'

describe Target do

  describe "associations" do
    it { expect(subject).to have_many(:deployments) }
  end

  it 'generates a valid Target' do
    expect(create(:target)).to be_valid
  end

  describe 'validations' do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:heroku_app_name) }
    it { expect(subject).to validate_presence_of(:heroku_git_remote) }
    it { expect(subject).to validate_presence_of(:git_remote) }
    it { expect(subject).to validate_presence_of(:git_default_branch) }
    it { expect(subject).to validate_presence_of(:url) }
  end

  describe 'default scope' do
    let!(:z) { create :target, name: 'zzzz' }
    let!(:a) { create :target, name: 'aaaa' }

    it "orders 'name ASC'" do
      expect(Target.all.to_a).to eql([a, z])
    end
  end

  describe '#deploy!' do
    subject(:target) { create :target }

    it 'creates a new deployment' do
      expect {
        target.deploy!
      }.to change(target.deployments, :count).by(1)
    end

    describe 'queued deployment' do
      subject(:deployment) { target.deploy! }

      it 'contains the default branch' do
        expect(subject.branch).to eql(target.git_default_branch)
      end

      it "has the state 'queued'" do
        expect(subject.state).to eql('queued')
      end
    end
  end
end
