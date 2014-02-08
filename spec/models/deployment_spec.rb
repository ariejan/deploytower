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
end
