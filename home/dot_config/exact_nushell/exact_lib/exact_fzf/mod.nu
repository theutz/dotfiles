export def --env setup-fzf []: nothing -> nothing {
  let latte = "
    --color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39
    --color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78
    --color=marker:#7287fd,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39
    --color=selected-bg:#bcc0cc
    --multi
  "

  let frappe = "
    --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284
    --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf
    --color=marker:#babbf1,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284
    --color=selected-bg:#51576d
    --multi
  "

  let macchiato = "
    --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796
    --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6
    --color=marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796
    --color=selected-bg:#494d64
    --multi
  "

  let mocha = "
    --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
    --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
    --color=selected-bg:#45475a
    --multi
  "

  dark-mode status
  | if ($in == "on") {
    $mocha
  } else {
    $latte
  }
  | $env.FZF_DEFAULT_OPTS = $in
}
