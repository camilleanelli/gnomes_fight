require 'spec_helper'

RSpec.describe "displaying a gnome", type: :system do
  fixtures :all

  it "can shows a gnome" do
    visit "/gnomes"

    click_link("Alberto")
    expect(page).to have_content("Alberto")
  end
end
