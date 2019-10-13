require 'spec_helper'

RSpec.describe "start a fight" do
  fixtures :all

  it "can start a new fight" do
    kim = gnomes(:gnome3)
    kim.life_score = 80
    kim.fight_score = 20
    kim.save

    alberto = gnomes(:gnome1)
    alberto.life_score = 70
    alberto.fight_score = 30
    alberto.save

    visit "/fights/new"

    choose('fight_gnome1_id_' + alberto.id.to_s)
    choose('fight_gnome2_id_' + kim.id.to_s)

    click_on "Fight!"

    expect(page).to have_content("The winner is ")

  end
end
