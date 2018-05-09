require 'spec_helper'
require './app/models/member'

describe Member do
  let(:attributes) {
    {
      name: "Snakebite",
      role: "leader",
      district: "9",
      party: "Yes"
    }
  }

  subject { Member.new(attributes) }

  context "initialize" do
    it "exists with valid attributes" do
      expect(subject.name).to eq("Snakebite")
      expect(subject.role).to eq("leader")
      expect(subject.district).to eq("9")
      expect(subject.party).to eq("Yes")
    end
  end
end
