require "rails_helper"

RSpec.describe "listing fights", type: :system do
  fixtures :all

  it "displays all fights" do
    visit "/fights"

    expect(page).to have_content("Alberto")
    expect(page).to have_content("Jim")
  end
end
