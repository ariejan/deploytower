require 'spec_helper'

describe DeploymentService do
  let(:target)     { build_stubbed :target }
  let(:deployment) { build_stubbed :deployment, target: target }

  describe '.deploy!' do
    describe 'with deployable target' do
      before do
        allow(target).to receive(:deployable?).and_return(true)
        allow(Deployment).to receive(:create!).and_return(deployment)
      end

      it 'creates a new Deployment record' do
        expect(Deployment).to receive(:create!).with({
          target:    target,
          branch:    target.git_default_branch,
          state:     'queued',
          reference: nil
        })

        DeploymentService.deploy!(target)
      end

      it 'returns the Deployment' do
        expect(DeploymentService.deploy!(target)).to eql(deployment)
      end

      it 'queues the deployment' do
        expect(DeploymentService).to receive(:queue_deployment).with(deployment)
        DeploymentService.deploy!(target)
      end
    end

    describe 'with non-deployable target' do
      before do
        allow(target).to receive(:deployable?).and_return(false)
      end

      it 'does not create a new Deployment record' do
        expect(Deployment).not_to receive(:create!)
        DeploymentService.deploy!(target)
      end

      it 'returns nil' do
        expect(DeploymentService.deploy!(target)).to be_nil
      end

      it 'does not queue the deployment' do
        expect(DeploymentService).not_to receive(:queue_deployment).with(deployment)
        DeploymentService.deploy!(target)
      end
    end
  end

  describe '.queue_deployment' do
    it 'queues the deployment' do
      expect(QC).to receive(:enqueue).with('DeploymentOperation.perform', deployment.id)
      DeploymentService.queue_deployment(deployment)
    end
  end
end
