require 'rails_helper'

feature "User searches for members of the house" do
  turn_off_vcr

  scenario "with a valid state" do
    stubbed_file = File.open("./spec/fixtures/json/propublica_current_members_of_the_house_co.json")
    stub_request(:get, "https://api.propublica.org/congress/v1/members/house/CO/current.json")
      .to_return(status: 200, body: stubbed_file)

    visit "/"

    select "Colorado", from: "state"

    click_on "Locate Members of the House"

    expect(current_path).to eq("/search")
    expect(current_url).to include("state=CO")

    expect(page).to have_content("7 Results")

    expect(page).to have_css(".member", count: 7)

    within(first(".member")) do
      expect(page).to have_css(".name")
      expect(page).to have_content("Diana DeGette")
      expect(page).to have_css(".party")
      expect(page).to have_css(".district")
      expect(page).to have_css(".role")
    end
  end
end
