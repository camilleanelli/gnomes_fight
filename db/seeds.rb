# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

#gnomes
names_country = {
  "George" => "Scotland",
  "Kim" => "Korea",
  "Marcel" => "France",
  "Roberto" => "Spain",
  "Jim" => "USA",
  "Paul" => "Belgium"
}

names_country.each do |name, country|
  Gnome.find_or_create_by(name: name) do |gnome|
    gnome.country = country
  end
end

#fights
Fight.create(gnome1: Gnome.first, gnome2: Gnome.find(3))

#weapons
weapons = {"hammer" => 20, "shovel" => 21, "bucket" => 19, "chisel" => 20, "stone" => 23, "axe" => 22, "watering can" => 18}

weapons.each do |name, power|
  Weapon.find_or_create_by(name: name) do |weapon|
    weapon.power = power
  end
end
