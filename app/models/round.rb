class Round < ApplicationRecord
  belongs_to :fight

  def start_first
    fighter_1 = fight.gnome1
    fighter_2 = fight.gnome2

    result = rand(0..1)
    result == 0 ? fighter_1 : fighter_2
  end

  def calculation
    start.life_score
  end
end
