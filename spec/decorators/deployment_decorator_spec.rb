require 'spec_helper'

describe DeploymentDecorator do

  let(:deployment) { build_stubbed :deployment }
  subject { described_class.decorate(deployment) }

  describe 'delegation' do
    it 'delegates methods' do
      expect(subject.id).to eql(deployment.id)
    end
  end

  describe '#haml_object_ref' do
    it 'returns the object_ref' do
      expect(subject.haml_object_ref).to eql("deployment")
    end
  end

  describe '#reference' do
    it 'returns the short ref' do
      expect(subject.reference).to eql(deployment.reference[0..8])
    end

    describe 'without reference set' do
      let(:deployment) { build_stubbed :deployment, reference: nil }

      it 'returns a "n/a" string' do
        expect(subject.reference).to eql('n/a')
      end
    end
  end

  describe '#long_reference' do
    it 'returns the full reference' do
      expect(subject.long_reference).to eql(deployment.reference)
    end
  end
end
