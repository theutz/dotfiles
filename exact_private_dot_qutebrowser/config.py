config.load_autoconfig(True)

c.editor.command = [
    "emacsclient",
    "--reuse-frame",
    "{}",
]
