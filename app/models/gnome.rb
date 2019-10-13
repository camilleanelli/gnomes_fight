class Gnome < ApplicationRecord
  has_many :fights

  before_create :set_default_life_score
  before_create :set_default_fight_score

  validates_presence_of :name

  def fights
    Fight.where("gnome1_id = ? OR gnome2_id = ?", self.id, self.id)
  end

  private

  def set_default_life_score
    self.life_score = rand(20..100)
  end

  def set_default_fight_score
    self.fight_score = rand(20..50)
  end
end
