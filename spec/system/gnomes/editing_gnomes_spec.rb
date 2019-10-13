require 'spec_helper'

RSpec.describe "editing gnomes", type: :system do
  fixtures :all

  it "can edit gnomes" do
    visit "/gnomes"

    find(:css, '#edit_'+Gnome.first.id.to_s).click
    expect(page).to have_content("Update")



  end
end
