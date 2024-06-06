use borders-preset.nu

export def default [] {
    print "DEFAULT mode"
    borders-preset base
}

export def yab [] {
    print "YAB mode"
    borders-preset gold
}

export def stack [] {
    print "STACK mode"
    borders-preset iris
}

export def go-back [] {
    print "Go back one mode"
    sendkeys send --characters <c:escape>
}

export def goto-root [] {
    print "Return to root mode"
    sendkeys send --characters <c:escape:shift>
}
