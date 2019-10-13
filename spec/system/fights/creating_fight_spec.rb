require 'spec_helper'

RSpec.describe "start a fight" do
  fixtures :all

  it "can start a new fight" do
    alberto = gnomes(:gnome1)
    kim = gnomes(:gnome3)

    visit "/fights/new"

    choose('fight_gnome1_' + alberto.id.to_s)
    choose('fight_gnome2_' + kim.id.to_s)

    click_on "Fight!"
    # expect(page).to have_content("The winner is")
  end
end
