class AddWinnerToFights < ActiveRecord::Migration[6.0]
  def change
    add_reference :fights, :winner
  end
end
