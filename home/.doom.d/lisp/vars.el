(load! "util")

(defconst theutz-fonts
  '("BlexMono Nerd Font"
    "Hasklug Nerd Font"
    "Monoid Nerd Font"
    "RobotoMono Nerd Font")
  "List of fonts that will be randomly selected from at startup.")

(defconst theutz-themes
  '(doom-palenight
    doom-outrun-electric
    doom-spacegrey
    doom-snazzy
    doom-vibrant
    doom-wilmersdorf
    doom-nord
    doom-laserwave)
  "List of themes that will be randomly selected from at startup.")

(defconst theutz-font (theutz/pick-random theutz-fonts)
  "Randomized font to be used for doom.")

(defconst theutz-theme (theutz/pick-random theutz-themes)
  "Randomized theme to be used for doom.")
