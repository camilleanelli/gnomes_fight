# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

names_country = {
  "George" => "Scotland",
  "Kim" => "Korea",
  "Marcel" => "France",
  "Roberto" => "Spain",
  "Jim" => "USA",
  "Paul" => "Belgium"
}

names_country.each do |name, country|
  Gnome.create(name: name, country: country)
end
