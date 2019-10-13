class CreateFights < ActiveRecord::Migration[6.0]
  def change
    create_table :fights do |t|
      t.references :gnome1
      t.references :gnome2

      t.timestamps
    end
  end
end
