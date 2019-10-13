require 'rails_helper'

RSpec.describe Gnome, type: :model do

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
