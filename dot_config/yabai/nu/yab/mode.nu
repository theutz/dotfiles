use borders-preset.nu

export def default [] {
    print "DEFAULT mode"
    borders-preset default
}

export def yab [] {
    print "YAB mode"
    borders-preset note
}

export def focus [] {
    print "FOCUS mode"
    borders-preset important
}

export def swap [] {
    print "SWAP mode"
    borders-preset warning
}

export def warp [] {
    print "WARP mode"
    borders-preset danger
}

export def go-back [] {
    print "Go back one mode"
    sendkeys send --characters <c:escape>
}

export def goto-root [] {
    print "Return to root mode"
    sendkeys send --characters <c:escape:shift>
}
