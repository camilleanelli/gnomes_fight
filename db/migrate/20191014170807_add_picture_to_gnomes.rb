class AddPictureToGnomes < ActiveRecord::Migration[6.0]
  def change
    add_column :gnomes, :picture, :string
  end
end
