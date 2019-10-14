require 'rails_helper'

RSpec.describe "editing gnomes", type: :system do
  fixtures :all

  it "can edit gnomes" do
    player = gnomes(:gnome1)
    visit "/gnomes"

    find(:css, '#edit_'+ player.id.to_s).click
    fill_in "Country", with: "Reunion"
    click_on "Update Gnome"
    click_link "#{player.name}"

    expect(page).to have_content("Country: Reunion")
  end
end
