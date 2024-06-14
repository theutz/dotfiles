from qutebrowser.config.configfiles import ConfigAPI  # type: ignore
from qutebrowser.config.config import ConfigContainer  # type: ignore
import subprocess

config: ConfigAPI = config  # pyright: ignore [reportUndefinedVariable] # noqa: F821
c: ConfigContainer = c  # noqa: F821 # pyright: ignore [reportUndefinedVariable]

config.load_autoconfig(True)

is_dark = subprocess.run(["dark-notify", "-e"], capture_output=True).stdout == b"dark\n"

# Theming

rose_pine = {
    "base": "#191724",
    "surface": "#1f1d2e",
    "overlay": "#26233a",
    "muted": "#6e6a86",
    "subtle": "#908caa",
    "text": "#e0def4",
    "love": "#eb6f92",
    "gold": "#f6c177",
    "rose": "#ebbcba",
    "pine": "#31748f",
    "foam": "#9ccfd8",
    "iris": "#c4a7e7",
    "highlight_low": "#21202e",
    "highlight_med": "#403d52",
    "highlight_high": "#524f67",
}

rose_pine_moon = {
    "base": "#232136",
    "surface": "#2a273f",
    "overlay": "#393552",
    "muted": "#6e6a86",
    "subtle": "#908caa",
    "text": "#e0def4",
    "love": "#eb6f92",
    "gold": "#f6c177",
    "rose": "#ea9a97",
    "pine": "#3e8fb0",
    "foam": "#9ccfd8",
    "iris": "#c4a7e7",
    "highlight_low": "#2a283e",
    "highlight_med": "#44415a",
    "highlight_high": "#56526e",
}

rose_pine_dawn = {
    "base": "#faf4ed",
    "surface": "#fffaf3",
    "overlay": "#f2e9e1",
    "muted": "#9893a5",
    "subtle": "#797593",
    "text": "#575279",
    "love": "#b4637a",
    "gold": "#ea9d34",
    "rose": "#d7827e",
    "pine": "#286983",
    "foam": "#56949f",
    "iris": "#907aa9",
    "highlight_low": "#f4ede8",
    "highlight_med": "#dfdad9",
    "highlight_high": "#cecacd",
}

theme = rose_pine if is_dark else rose_pine_dawn

# Settings

# c.editor.command = [
#     "emacsclient",
#     "--reuse-frame",
#     "{}",
# ]

c.editor.command = ["neovide", "--no-fork", "{}"]

c.colors.completion.category.bg = theme.get("base")
c.colors.completion.category.border.bottom = theme.get("base")
c.colors.completion.category.border.top = theme.get("base")
c.colors.completion.category.fg = theme.get("text")
c.colors.completion.even.bg = theme.get("base")
c.colors.completion.fg = [
    theme.get("text"),
    theme.get("muted"),
    theme.get("muted"),
]  # one for each column
c.colors.completion.item.selected.bg = theme.get("gold")
c.colors.completion.item.selected.border.bottom = theme.get("gold")
c.colors.completion.item.selected.border.top = theme.get("gold")
c.colors.completion.item.selected.fg = theme.get("surface")
c.colors.completion.item.selected.match.fg = theme.get("muted")
c.colors.completion.match.fg = theme.get("gold")
c.colors.completion.odd.bg = theme.get("surface")
c.colors.completion.scrollbar.bg = theme.get("base")
c.colors.completion.scrollbar.fg = theme.get("subtle")
c.colors.contextmenu.disabled.bg = theme.get("highlight_low")
c.colors.contextmenu.disabled.fg = theme.get("text")
c.colors.contextmenu.menu.bg = theme.get("base")
c.colors.contextmenu.menu.fg = theme.get("text")
c.colors.contextmenu.selected.bg = theme.get("subtle")
c.colors.contextmenu.selected.fg = theme.get("text")
c.colors.downloads.bar.bg = theme.get("overlay")
c.colors.downloads.error.bg = theme.get("rose")
c.colors.downloads.error.fg = theme.get("text")
c.colors.downloads.start.bg = theme.get("iris")
c.colors.downloads.start.fg = theme.get("base")
c.colors.downloads.stop.bg = theme.get("pine")
c.colors.downloads.stop.fg = theme.get("base")
c.colors.hints.bg = theme.get("gold")
c.colors.hints.fg = theme.get("surface")
c.colors.hints.match.fg = theme.get("pine")
c.colors.keyhint.bg = theme.get("surface")
c.colors.keyhint.fg = theme.get("text")
c.colors.keyhint.suffix.fg = theme.get("iris")
c.colors.messages.error.bg = theme.get("love")
c.colors.messages.error.border = theme.get("love")
c.colors.messages.error.fg = theme.get("base")
c.colors.messages.info.bg = theme.get("foam")
c.colors.messages.info.border = theme.get("foam")
c.colors.messages.info.fg = theme.get("base")
c.colors.messages.warning.bg = theme.get("gold")
c.colors.messages.warning.border = theme.get("gold")
c.colors.messages.warning.fg = theme.get("base")
c.colors.prompts.bg = theme.get("gold")
c.colors.prompts.border = theme.get("surface")
c.colors.prompts.fg = theme.get("surface")
c.colors.statusbar.caret.selection.bg = theme.get("iris")
c.colors.statusbar.caret.selection.fg = theme.get("base")
c.colors.statusbar.command.bg = theme.get("base")
c.colors.statusbar.command.fg = theme.get("text")
c.colors.statusbar.command.private.bg = theme.get("highlight_high")
c.colors.statusbar.command.private.fg = theme.get("text")
c.colors.statusbar.insert.bg = theme.get("foam")
c.colors.statusbar.insert.fg = theme.get("base")
c.colors.statusbar.normal.bg = theme.get("base")
c.colors.statusbar.normal.fg = theme.get("muted")
c.colors.statusbar.private.bg = theme.get("highlight_med")
c.colors.statusbar.private.fg = theme.get("text")
c.colors.statusbar.progress.bg = theme.get("iris")
c.colors.statusbar.url.error.fg = theme.get("love")
c.colors.statusbar.url.fg = theme.get("text")
c.colors.statusbar.url.hover.fg = theme.get("gold")
c.colors.statusbar.url.success.http.fg = theme.get("rose")
c.colors.statusbar.url.success.https.fg = theme.get("pine")
c.colors.statusbar.url.warn.fg = theme.get("iris")
c.colors.tabs.bar.bg = theme.get("base")
c.colors.tabs.even.bg = theme.get("surface")
c.colors.tabs.even.fg = theme.get("text")
c.colors.tabs.indicator.error = theme.get("love")
c.colors.tabs.indicator.start = theme.get("iris")
c.colors.tabs.indicator.stop = theme.get("pine")
c.colors.tabs.odd.bg = theme.get("base")
c.colors.tabs.odd.fg = theme.get("text")
c.colors.tabs.pinned.even.bg = theme.get("surface")
c.colors.tabs.pinned.even.fg = theme.get("text")
c.colors.tabs.pinned.odd.bg = theme.get("base")
c.colors.tabs.pinned.odd.fg = theme.get("text")
c.colors.tabs.pinned.selected.even.bg = theme.get("gold")
c.colors.tabs.pinned.selected.even.fg = theme.get("surface")
c.colors.tabs.pinned.selected.odd.bg = theme.get("gold")
c.colors.tabs.pinned.selected.odd.fg = theme.get("surface")
c.colors.tabs.selected.even.bg = theme.get("gold")
c.colors.tabs.selected.even.fg = theme.get("surface")
c.colors.tabs.selected.odd.bg = theme.get("gold")
c.colors.tabs.selected.odd.fg = theme.get("surface")
c.colors.tooltip.bg = theme.get("subtle")
c.colors.tooltip.fg = theme.get("text")

c.fonts.contextmenu = "12pt default_family"
c.fonts.default_family = "BlexMono Nerd Font"
c.fonts.default_size = "14pt"
c.fonts.downloads = "default_size default_family"
c.fonts.hints = "bold 12pt default_family"
c.fonts.keyhint = "default_size default_family"
c.fonts.statusbar = "default_size default_family"
c.fonts.tabs.selected = "bold default_size default_family"
c.fonts.tabs.unselected = "default_size default_family"
c.fonts.tooltip = "12pt default_family"
c.fonts.web.family.cursive = "BlexMono Nerd Font"
c.fonts.web.family.fixed = "BlexMono Nerd Font"
c.fonts.web.family.serif = "IBM Plex Serif"
c.fonts.web.family.standard = "IBM Plex Sans"
c.fonts.web.size.minimum_logical = 6


c.hints.border = "0 none " + theme.get("gold", "")
c.hints.padding = {"bottom": 0, "left": 3, "right": 3, "top": 0}
c.hints.radius = 5
c.hints.uppercase = True

c.qt.environ = {
    "PATH": "/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
}

c.statusbar.position = "bottom"
c.statusbar.padding = {"top": 8, "right": 8, "bottom": 8, "left": 8}

c.colors.webpage.darkmode.enabled = is_dark

never_dark_mode = ["*://docs.google.com/*", "*://mail.google.com/*"]
for pattern in never_dark_mode:
    with config.pattern(pattern) as p:
        p.colors.webpage.darkmode.enabled = False

for url in [
    "https://click.redditmail.com/*",
    "https://*.bugherd.com/*",
    "https://sentry.io/*",
    "https://p.typekit.net/*",
]:
    c.content.blocking.whitelist.append(url)

notifications_allowed = ["https://app.slack.com"]
for site in notifications_allowed:
    with config.pattern(site) as p:
        p.content.notifications.enabled = True

notifications_blocked = ["https://www.facebook.com"]
for site in notifications_blocked:
    with config.pattern(site) as p:
        p.content.notifications.enabled = False

c.url.searchengines = {
    "DEFAULT": "https://kagi.com/search?q={}",
    "!k": "https://kagi.com/search?q={}",
    "!g": "https://google.com/search?q={}&udm=14",
    "!tw": "https://kagi.com/search?q=!tw+{}",  # kagi search with tailwind lens,
    "!lar": "https://kagi.com/search?1=!laravel+{}",
}

c.url.start_pages = "https://kagi.com"

c.content.pdfjs = True

c.completion.height = "20%"
c.completion.shrink = True
c.completion.use_best_match = True

# Bindings
normal_bindings = {
    "<Escape>": "clear-keychain ;; search ;; fullscreen --leave ;; clear-messages",
    "<Meta+,>": "config-edit",
    "J": "tab-next",
    "K": "tab-prev",
    "ge": "edit-url {url}",
    "tdH": "config-cycle -p -u *://*.{url:host}/* colors.webpage.darkmode.enabled",
    "tdh": "config-cycle -p -u *://{url:host}/* colors.webpage.darkmode.enabled",
    "tdu": "config-cycle -p -u {url} colors.webpage.darkmode.enabled",
    "tnu": "config-cycle -p -u {url} content.notifications.enabled true false ask",
    "tnh": "config-cycle -p -u *://{url:host}/* content.notifications.enabled true false ask",
    "tnH": "config-cycle -p -u *://*.{url:host}/* content.notifications.enabled true false ask",
    "sth": "set tabs.position left ;; clear-messages",
    "stj": "set tabs.position bottom ;; clear-messages",
    "stk": "set tabs.position top ;; clear-messages",
    "stl": "set tabs.position right ;; clear-messages",
    "st=": "config-cycle -p tabs.width 10% 15% 20% 25% 30% 35% 40% 45% 50% ;; clear-messages",
    "st-": "config-cycle -p tabs.width 50% 45% 40% 35% 30% 25% 20% 15% 10% ;; clear-messages",
    "sS": "cmd-set-text --space :session-save --only-active-window --current",
    "ss": "cmd-set-text --space :session-save --current",
    "so": "cmd-set-text --space :session-load --clear",
    "shs": "cmd-set-text --space :help -t",
    "shk": "open -t qute://bindings",
}
for key, cmd in normal_bindings.items():
    config.bind(key, cmd)

command_bindings = {"<Ctrl+e>": "cmd-edit --run"}
for key, cmd in command_bindings.items():
    config.bind(key, cmd, mode="command")

c.tabs.title.format_pinned = "{audio}{index}: 📌 {current_title}"
