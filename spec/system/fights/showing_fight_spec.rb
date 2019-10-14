require 'rails_helper'

RSpec.describe 'displaying a fight', type: :system do
  fixtures :all

  it "shows a fight" do
    fight = fights(:fight)

    visit "/fights/#{fight.id}"

    expect(page).to have_content("ALBERTO WIN !")
  end
end
