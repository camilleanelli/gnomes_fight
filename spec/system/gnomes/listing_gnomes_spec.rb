require 'spec_helper'

RSpec.describe "listing gnomes", type: :system do
  fixtures :all

  it "displays the gnomes" do
    visit "/gnomes"

    expect(page).to have_content("Alberto")
    expect(page).to have_content("Jim")
  end
end
