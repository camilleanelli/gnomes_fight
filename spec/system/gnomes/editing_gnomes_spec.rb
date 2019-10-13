require 'spec_helper'

RSpec.describe "editing gnomes", type: :system do
  fixtures :all

  it "can edit gnomes" do
    visit "/gnomes"

    find(:css, '#edit_'+ Gnome.first.id.to_s).click
    fill_in "Country", with: "Reunion"
    click_button "Confirm update"
    click_link "#{Gnome.first.name}"

    expect(page).to have_content("Country: Reunion")
  end
end
