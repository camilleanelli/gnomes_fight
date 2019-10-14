require 'rails_helper'

RSpec.describe "deleting gnome", type: :system do
  fixtures :all

  it "can delete gnomes" do
    player = gnomes(:gnome1)
    visit "/gnomes/#{player.id}"

    click_link "Delete this player"

    expect(page).to_not have_content(player.name)
  end
end
