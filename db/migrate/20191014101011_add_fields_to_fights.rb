class AddFieldsToFights < ActiveRecord::Migration[6.0]
  def change
    add_reference :fights, :weapon_one
    add_reference :fights, :weapon_two
  end
end
