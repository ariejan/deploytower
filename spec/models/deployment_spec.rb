require 'spec_helper'

describe Deployment do
  describe 'associations' do
    it { expect(subject).to belong_to(:target) }
  end

  describe '#deploying!' do
    subject(:deployment) { create :deployment }

    it 'transitions from "queued" to "deploying"' do
      expect {
        deployment.deploying!
      }.to change(deployment, :state).from('queued').to('deploying')
    end
  end

  describe '#finish!' do
    subject(:deployment) { create :deployment, state: 'deploying' }

    it 'transitions from "deploying" to "finished"' do
      expect {
        deployment.finished!
      }.to change(deployment, :state).from('deploying').to('finished')
    end
  end
end
