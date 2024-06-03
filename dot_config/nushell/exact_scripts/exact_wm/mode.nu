# [[file:../../nushell.org::*mode][mode:1]]
export module mode {
    export def go-back [] {
        print "Go back one mode"
        skhd -k escape
    }
    
    export def goto-root [] {
        print "Return to root mode"
        skhd -k shift - escape
    }

    export def default [] {
        use borders-presets.nu
        print "DEFAULT mode"
        borders-preset default
    }
    
    export def yab [] {
        use borders-preset.nu
        print "YAB mode"
        borders-preset note
    }
    
    export def focus [] {
        use borders-preset.nu
        print "FOCUS mode"
        borders-preset important
    }
    
    export def swap [] {
        use borders-preset.nu
        print "SWAP mode"
        borders-preset warning
    }
    
    export def warp [] {
        use borders-preset.nu
        print "WARP mode"
        borders-preset danger
    }
}
# mode:1 ends here
