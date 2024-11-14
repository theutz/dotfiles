from qutebrowser.config.configfiles import ConfigAPI  # type: ignore
from qutebrowser.config.config import ConfigContainer  # type: ignore
import subprocess

config: ConfigAPI = config  # pyright: ignore [reportUndefinedVariable] # noqa: F821
c: ConfigContainer = c  # noqa: F821 # pyright: ignore [reportUndefinedVariable]

config.load_autoconfig(True)

# Settings

c.editor.command = ["neovide", "--no-fork", "{}"]

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


c.hints.padding = {"bottom": 1, "left": 4, "right": 4, "top": 1}
c.hints.radius = 5
c.hints.uppercase = True

c.qt.environ = {
    "PATH": "/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
}

c.statusbar.position = "bottom"
c.statusbar.padding = {"top": 8, "right": 8, "bottom": 8, "left": 8}

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
    "!i": "https://kagi.com/images?q={}",
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
    "tdH": "config-cycle -p -u *://*.{url:host}/* colors.webpage.darkmode.enabled false true ;; reload",
    "tdh": "config-cycle -p -u *://{url:host}/* colors.webpage.darkmode.enabled false true ;; reload",
    "tdu": "config-cycle -p -u {url} colors.webpage.darkmode.enabled false true ;; reload",
    "tnu": "config-cycle -p -u {url} content.notifications.enabled true false ask",
    "tnh": "config-cycle -p -u *://{url:host}/* content.notifications.enabled true false ask",
    "tnH": "config-cycle -p -u *://*.{url:host}/* content.notifications.enabled true false ask",
    "sth": "set tabs.position left ;; clear-messages",
    "stj": "set tabs.position bottom ;; clear-messages",
    "stk": "set tabs.position top ;; clear-messages",
    "stl": "set tabs.position right ;; clear-messages",
    "st=": "config-cycle -p tabs.width 10% 15% 20% 25% 30% 35% 40% 45% 50% ;; clear-messages",
    "st-": "config-cycle -p tabs.width 50% 45% 40% 35% 30% 25% 20% 15% 10% ;; clear-messages",
    "ss": "cmd-set-text --space :session-save",
    "so": "cmd-set-text --space :session-load --clear",
    "shs": "cmd-set-text --space :help -t",
    "shk": "open -t qute://bindings",
    "yb": "spawn --output-messages buku --nostdin --nc -w neovide -a {url:pretty}",
    "yj": "yank selection ;; spawn --output-messages jrnl --edit {clipboard} {url:pretty}",
    "gxc": "spawn --output-messages open -a 'Google Chrome.app' {url:pretty} ;; tab-close",
    "gxf": "spawn --output-messages open -a 'Firefox.app' {url:pretty} ;; tab-close",
    ";xc": "hint links spawn --output-messages open -a 'Google Chrome.app' {hint-url}",
    ";xf": "hint links spawn --output-messages open -a 'Firefox.app' {hint-url}",
    "gs": "spawn -u social",
}
for key, cmd in normal_bindings.items():
    config.bind(key, cmd)

command_bindings = {"<Ctrl+e>": "cmd-edit --run"}
for key, cmd in command_bindings.items():
    config.bind(key, cmd, mode="command")

c.tabs.title.format_pinned = "{audio}{index}: 📌 {current_title}"

c.content.javascript.log_message.excludes = {
    "userscript:_qute_stylesheet": [
        "*Refused to apply inline style because it violates the following Content Security Policy directive: *"
    ],
    "userscript:_qute_js": ["*TrustedHTML*"],
}
