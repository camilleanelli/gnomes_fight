require 'rails_helper'

RSpec.describe Fight, type: :model do
  describe 'associations' do
    it { should belong_to(:gnome1).class_name('Gnome')}
    it { should belong_to(:gnome2).class_name('Gnome')}
    it { should belong_to(:weapon_one).class_name('Weapon').optional}
    it { should belong_to(:weapon_two).class_name('Weapon').optional}
  end

  it 'can assign a gnome winner at the end of the game' do
    fight = Fight.create(gnome1: Gnome.last, gnome2: Gnome.first)

    expect(fight).to be_valid
    fight.update(winner: fight.gnome2)

    expect(fight.winner).to eql(fight.gnome2)
  end

  describe "call" do

    it "trigger the fight", focus: true do
     gnome1 = Gnome.create(name: "alberto")
     gnome1.life_score = 50
     gnome1.fight_score = 50
     gnome1.save

     gnome2 = Gnome.create(name: "xavier")
     gnome2.life_score = 50
     gnome2.fight_score = 10
     gnome2.save

     fight = Fight.create(gnome1: gnome1, gnome2: gnome2)

     expect(fight.find_winner_gnome).to eql(gnome1)
   end

    it "trigger the fight with more rounds", focus: true do
      gnome1 = Gnome.create(name: "alberto")
      gnome1.life_score = 10
      gnome1.fight_score = 10
      gnome1.save

      gnome2 = Gnome.create(name: "xavier")
      gnome2.life_score = 20
      gnome2.fight_score = 1
      gnome2.save

     fight = Fight.create(gnome1: gnome1, gnome2: gnome2)

      expect(fight.find_winner_gnome).to eql(gnome1)
    end

    it "trigger the fight with more rounds", focus: true do
      gnome1 = Gnome.create(name: "alberto")
      gnome1.life_score = 100
      gnome1.fight_score = 20
      gnome1.save

      gnome2 = Gnome.create(name: "xavier")
      gnome2.life_score = 70
      gnome2.fight_score = 10
      gnome2.save

      fight = Fight.create(gnome1: gnome1, gnome2: gnome2)

      expect(fight.find_winner_gnome).to eql(gnome1)
      expect(fight.rounds.count).to eql(7)
      expect(fight.reload.winner).to eq(gnome1)
    end
  end
end
