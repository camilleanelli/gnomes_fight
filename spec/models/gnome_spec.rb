require 'rails_helper'

RSpec.describe Gnome, type: :model do
    fixtures :all

    describe "fights" do
      it "has many fights" do
        fight = Fight.create(gnome1: gnomes(:gnome2), gnome2: gnomes(:gnome3))
        fight2 = Fight.create(gnome1: gnomes(:gnome2), gnome2: gnomes(:gnome1))

        expect(gnomes(:gnome2).fights.count).to eql(2)
        expect(gnomes(:gnome3).fights.count).to eql(1)
      end
    end

    it "is not valid without a name" do
    expect(Gnome.new).to_not be_valid
  end

  it "has a random life score value" do
    gnome = Gnome.create(name: "example")

    expect(gnome.life_score).to_not be_nil
  end

  it "has a random fight_score value" do
    gnome = Gnome.create(name: "example")

    expect(gnome.fight_score).to_not be_nil
  end
end
