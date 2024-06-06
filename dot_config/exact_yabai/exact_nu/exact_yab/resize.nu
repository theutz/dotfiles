export def main [dir: string, x: number, y: number] {
    yabai -m window --resize $"($dir):($x | into string):($y | into string)"
}

export def left [amount: number] {
    [[dir x y];
     [left $amount 0]
     [right $amount 0]
    ] | each (apply -x)
}

export def down [amount: number] {
    [[dir x y];
     [bottom 0 $amount]
     [top 0 $amount]
    ] | each (apply)
}

export def up [amount: number] {
    [[dir x y];
     [top 0 $amount]
     [bottom 0 $amount]
    ] | each (apply -y)
}

export def right [amount: number] {
    [[dir x y];
     [right $amount 0]
     [left $amount 0]
    ] | each (apply)
}
