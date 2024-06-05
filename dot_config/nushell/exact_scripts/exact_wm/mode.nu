# [[file:../../nushell.org::*default][default:1]]
export def default [] {
    use borders-preset.nu
    print "DEFAULT mode"
    borders-preset default
}
# default:1 ends here

# [[file:../../nushell.org::*yab][yab:1]]
export def yab [] {
    use borders-preset.nu
    print "YAB mode"
    borders-preset note
}
# yab:1 ends here

# [[file:../../nushell.org::*focus][focus:1]]
export def focus [] {
    use borders-preset.nu
    print "FOCUS mode"
    borders-preset important
}
# focus:1 ends here

# [[file:../../nushell.org::*swap][swap:1]]
export def swap [] {
    use borders-preset.nu
    print "SWAP mode"
    borders-preset warning
}
# swap:1 ends here

# [[file:../../nushell.org::*warp][warp:1]]
export def warp [] {
    use borders-preset.nu
    print "WARP mode"
    borders-preset danger
}
# warp:1 ends here

# [[file:../../nushell.org::*go-back][go-back:1]]
export def go-back [] {
    print "Go back one mode"
    skhd -k escape
}
# go-back:1 ends here

# [[file:../../nushell.org::*goto-root][goto-root:1]]
export def goto-root [] {
    print "Return to root mode"
    skhd -k shift - escape
}
# goto-root:1 ends here
