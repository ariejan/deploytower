require 'spec_helper'

describe Target do
  context "validations" do
    it { expect(subject).to validate_presence_of(:name) }
  end
end
