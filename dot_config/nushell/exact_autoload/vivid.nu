$env.LS_COLORS = $env.APPEARANCE?
  | match $in {
    light => "rose-pine-dawn"
    _ => "rose-pine"
  }
  | vivid generate $in
