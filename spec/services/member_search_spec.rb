require 'rails_helper'

describe MemberSearch do
  subject { MemberSearch.new("CO") }

  context "initialize" do
    it "exists with a valid state" do
      expect(subject).to be_a MemberSearch
    end
  end

  context "instance methods" do
    context "#members" do
      it "returns a collection of members" do
        VCR.use_cassette("MemberSearch#members") do
          expect(subject.members.count).to eq(7)
          expect(subject.members.first).to be_a Member
        end
      end
    end
  end
end
