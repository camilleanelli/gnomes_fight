class Fight < ApplicationRecord
  belongs_to :gnome1, class_name: "Gnome", foreign_key: "gnome1_id"
  belongs_to :gnome2, class_name: "Gnome", foreign_key: "gnome2_id"

  belongs_to :winner, class_name: "Gnome", foreign_key: "winner_id", optional: true
end
