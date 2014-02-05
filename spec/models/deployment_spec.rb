require 'spec_helper'

describe Deployment do
  describe "associations" do
    it { expect(subject).to belong_to(:target) }
  end
end
