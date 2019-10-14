require 'rails_helper'

RSpec.describe Fight, type: :model do
  fixtures :all

  describe 'associations' do
    it { should belong_to(:gnome1).class_name('Gnome')}
    it { should belong_to(:gnome2).class_name('Gnome')}
    it { should belong_to(:weapon_one).class_name('Weapon').optional}
    it { should belong_to(:weapon_two).class_name('Weapon').optional}
  end


  describe "validations" do

    it '#gnomes_must_be_different' do
     gnome1 = Gnome.create(name: "alberto")
     fight = Fight.create(gnome1: gnome1, gnome2: gnome1)
     expect(fight).not_to be_persisted
     expect(fight).not_to be_valid
    end

    it "has validation of presence on foreign_keys" do
     fight = Fight.create(gnome1: nil, gnome2: nil)
     expect(fight).not_to be_persisted
     expect(fight).not_to be_valid
    end
  end

  describe '#compute_damage_done' do
    alberto = Gnome.create(name: "alberto")
    alberto.update(life_score: 30, fight_score: 50)

    xavier = Gnome.create(name: "xavier")
    xavier.update(life_score: 20, fight_score: 60)

    it 'calculates the damage made by attacker' do
      fight = Fight.create(gnome1: alberto, gnome2: xavier)

      #beetween 60% and 100% of the fight_score
      expect(fight.send(:compute_damage_done, alberto)).to be >= 30
      expect(fight.send(:compute_damage_done, alberto)).to be <= 50

    end

    it 'adds power to fight score when weapon is present' do
      fight = Fight.create(gnome1: alberto, gnome2: xavier, weapon_one: weapons(:bucket))

      #on 9 points de forces sont ajoutes sur alberto
      expect(fight.send(:compute_damage_done, alberto)).to be >= 35
      expect(fight.send(:compute_damage_done, alberto)).to be <= 59

    end
  end

  it 'assign a gnome winner at the end of the game' do
    gnome1 = Gnome.create(name: "alberto")
    gnome2 = Gnome.create(name: "xavier")
    fight = Fight.create(gnome1: gnome1, gnome2: gnome2)

    expect(fight).to be_valid
    fight.update(winner: fight.gnome2)

    expect(fight.winner).to eql(fight.gnome2)
  end

  describe "find_winner_gnome" do
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
      expect(fight.rounds.count).to be > 3
      expect(fight.reload.winner).to eq(gnome1)
    end
  end
end
