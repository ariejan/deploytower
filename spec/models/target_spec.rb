require 'spec_helper'

describe Target do
  context "validations" do
    it { expect(subject).to validate_presence_of(:name) }
  end

  context "default scope" do
    let!(:z) { create :target, name: "zzzz" }
    let!(:a) { create :target, name: "aaaa" }

    it "orders 'name ASC'" do
      expect(Target.all.to_a).to eql([a, z])
    end
  end
end
