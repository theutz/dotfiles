(load! "util")

(defconst theutz-fonts
  '("BlexMono Nerd Font"
    "Hasklug Nerd Font"
    "Monoid Nerd Font"
    "RobotoMono Nerd Font")
  "List of fonts that will be randomly selected from at startup.")

(defconst theutz-font (theutz/pick-random theutz-fonts)
  "Randomized font to be used for doom.")
