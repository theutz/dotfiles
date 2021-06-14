(load! "util")

(defconst theutz-fonts
  '("MesloLGS NF")
  "List of fonts that will be randomly selected from at startup.")

(defconst theutz-font (theutz/pick-random theutz-fonts)
  "Randomized font to be used for doom.")
