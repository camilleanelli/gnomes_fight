require 'rails_helper'

RSpec.describe "creating gnome", type: :system do
  fixtures :all

  it "can create a new gnome" do
    visit "/gnomes/new"

    fill_in "Name", with: "George"
    fill_in "Country", with: "Scotland"

    click_button "Create Gnome"

    expect(page).to have_content("George")
    expect(page).to have_content("Scotland")
  end

end
