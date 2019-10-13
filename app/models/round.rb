class Round < ApplicationRecord
  belongs_to :fight
  belongs_to :attacker, class_name: "Gnome", foreign_key: "attacker_id"
  belongs_to :defenser, class_name: "Gnome", foreign_key: "defenser_id"
end
