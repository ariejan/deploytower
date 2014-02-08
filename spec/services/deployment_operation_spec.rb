require 'spec_helper'

describe DeploymentOperation do
  let(:deployment) { build_stubbed :deployment }

  before do
    allow(deployment).to receive(:deploying!)
    allow(deployment).to receive(:finished!)
  end

  describe '.perform' do
    before do
      allow(Deployment).to receive(:find).and_return(deployment)
    end

    it 'executes the deployment' do
      expect(DeploymentOperation).to receive(:new).with(deployment).and_call_original
      DeploymentOperation.perform(deployment.id)
    end
  end

  describe '#perform' do
    subject { DeploymentOperation.new(deployment) }

    it 'updates the state to "deploying"' do
      expect(deployment).to receive(:deploying!)
      subject.perform
    end

    it 'updates the state to "finished"' do
      expect(deployment).to receive(:finished!)
      subject.perform
    end
  end
end
