require 'spec_helper'

describe Target do

  describe 'associations' do
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

    describe 'when deployable' do
      before do
        expect(target).to receive(:deployable?).and_return(true)
      end

      it 'creates a new deployment' do
        expect do
          target.deploy!
        end.to change(target.deployments, :count).by(1)
      end
    end

    describe 'when not deployable' do
      before do
        expect(target).to receive(:deployable?).and_return(false)
      end

      it 'creates a new deployment' do
        expect do
          target.deploy!
        end.not_to change(target.deployments, :count)
      end
    end

    describe 'resulting queued deployment' do
      subject(:deployment) { target.deploy! }

      it 'contains the default branch' do
        expect(subject.branch).to eql(target.git_default_branch)
      end

      it "has the state 'queued'" do
        expect(subject.state).to eql('queued')
      end
    end
  end

  describe '#deployable?' do
    subject(:target) { create :target }

    describe 'is deployable' do
      it 'by default' do
        expect(subject).to be_deployable
      end

      it 'with a finished deployment' do
        create :finished_deployment, target: target
        expect(subject).to be_deployable
      end
    end

    describe 'is not deployable' do
      it 'with a queued deployment' do
        create :queued_deployment, target: target
        expect(subject).not_to be_deployable
      end
    end
  end
end
