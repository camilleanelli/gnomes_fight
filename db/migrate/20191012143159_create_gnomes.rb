class CreateGnomes < ActiveRecord::Migration[6.0]
  def change
    create_table :gnomes do |t|
      t.integer :life_score
      t.integer :fight_score
      t.string :name
      t.string :country

      t.timestamps
    end
  end
end
