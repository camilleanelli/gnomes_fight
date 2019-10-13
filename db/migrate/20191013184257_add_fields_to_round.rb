class AddFieldsToRound < ActiveRecord::Migration[6.0]
  def change
    add_reference :rounds, :attacker
    add_reference :rounds, :defenser
    add_column :rounds, :initial_attacker_pv, :integer
    add_column :rounds, :initial_defenser_pv, :integer
    add_column :rounds, :defenser_damage_taken, :integer
  end
end
