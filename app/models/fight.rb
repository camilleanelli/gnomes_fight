class Fight < ApplicationRecord
  has_many :rounds
  belongs_to :gnome1, class_name: "Gnome", foreign_key: "gnome1_id"
  belongs_to :gnome2, class_name: "Gnome", foreign_key: "gnome2_id"

  belongs_to :weapon_one, class_name: "Weapon", foreign_key: "weapon_one_id", optional: true
  belongs_to :weapon_two, class_name: "Weapon", foreign_key: "weapon_two_id", optional: true

  belongs_to :winner, class_name: "Gnome", foreign_key: "winner_id", optional: true

  validate :gnomes_must_be_different

  def find_winner_gnome
    attacker, defenser = [gnome1, gnome2]
    while(check_ending(attacker, defenser).nil?) do
      initial_defenser_pv = defenser.life_score
      defenser.life_score = initial_defenser_pv - compute_damage_done(attacker)
      self.rounds.create(attacker: attacker,
        defenser: defenser,
        initial_attacker_pv: attacker.life_score,
        initial_defenser_pv: initial_defenser_pv,
        defenser_damage_taken: compute_damage_done(attacker) )
      attacker, defenser = defenser, attacker
    end
    winner = check_ending(attacker, defenser)
    self.winner = winner
    self.save
    winner
  end

  private

  def compute_damage_done(attacker)
    attacker_fight_score = (attacker.fight_score*rand(0.6..1)).floor
    if attacker == gnome1 && weapon_one_id
      result = attacker_fight_score + weapon_one.power
    elsif attacker == gnome2 && weapon_two_id
      result = attacker_fight_score + weapon_two.power
    else
      result = attacker_fight_score
    end
    result
  end

  def check_ending(attacker, defenser)
    return attacker if defenser.life_score <= 0
    return defenser if attacker.life_score <= 0
  end

  def gnomes_must_be_different
    if self.gnome1_id == self.gnome2_id
      self.errors.add(:gnome2_id, "The gnomes must be different")
      return false
    end
  end
end
