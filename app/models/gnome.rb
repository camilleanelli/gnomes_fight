class Gnome < ApplicationRecord
  before_save :set_default_life_score
  before_save :set_default_fight_score

  validates_presence_of :name

  private

  def set_default_life_score
    self.life_score = rand(20..100)
  end

  def set_default_fight_score
    self.fight_score = rand(20..50)
  end
end
