require 'spec_helper'

describe DeploymentOperation do
  describe '.perform' do
    let!(:deployment) { build_stubbed :deployment }

    before do
      allow(Deployment).to receive(:find).and_return(deployment)
    end

    it 'updates the state to "deploying"' do
      expect(deployment).to receive(:deploying!)
      DeploymentOperation.perform(deployment.id)
    end
  end
end
