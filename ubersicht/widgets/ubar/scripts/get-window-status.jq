{
    sticky: .sticky?,
    floating: .floating?,
    split: .split?,
    zoom: (
        if ."zoom-parent"? == 1
            then "zoom-parent"
        elif ."zoom-fullscreen"? == 1
            then "zoom-fullscreen"
        else "none" end
    )
}
