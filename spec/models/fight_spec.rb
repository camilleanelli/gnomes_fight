require 'rails_helper'

RSpec.describe Fight, type: :model do
  describe 'associations' do
    it { should belong_to(:gnome1).class_name('Gnome')}
    it { should belong_to(:gnome2).class_name('Gnome')}
  end

  it 'can assign a gnome winner at the end of the game' do
    fight = Fight.create(gnome1: Gnome.last, gnome2: Gnome.first)

    expect(fight).to be_valid
    fight.update(winner: fight.gnome2)

    expect(fight.winner).to eql(fight.gnome2)
  end
end
