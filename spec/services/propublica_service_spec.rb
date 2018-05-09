require 'rails_helper'

describe PropublicaService do
  subject { PropublicaService.new("CO") }

  context "initialize" do
    it "exists" do
      expect(subject).to be_a PropublicaService
    end
  end

  context "instance methods" do
    context "#members" do
      it "returns array of member hashes" do
        VCR.use_cassette("propublica-service") do
          members = subject.members
          member = members.first

          expect(members).to be_an Array
          expect(members.count).to eq(7)

          expect(member).to have_key(:name)
          expect(member[:name]).to be_a String

          expect(member).to have_key(:role)
          expect(member[:role]).to be_a String

          expect(member).to have_key(:party)
          expect(member[:party]).to be_a String

          expect(member).to have_key(:district)
          expect(member[:district]).to be_a String
        end
      end
    end
  end
end
