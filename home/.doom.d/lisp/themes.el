(load! "util")

(defconst theutz-themes
  '(doom-palenight
    doom-outrun-electric
    doom-spacegrey
    doom-snazzy
    doom-vibrant
    doom-wilmersdorf
    doom-nord)
  "List of themes that will be randomly selected from at startup.")

(defconst theutz-theme (theutz/pick-random theutz-themes)
  "Randomized theme to be used for doom.")
