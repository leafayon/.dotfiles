''
hl.window_rule({ match = { class = "^(jetbrains-.*|dev.zed.Zed)$" }, workspace = 1 })
hl.window_rule({ match = { class = "^(discord-canary|teamspeak)$" }, workspace = 4 })
hl.window_rule({ match = { class = "^(steam|steam_app_.*)$" }, workspace = 7 })

hl.workspace_rule({ workspace = 1, monitor = "DP-1" })
hl.workspace_rule({ workspace = 3, monitor = "DP-1", default = true })
hl.workspace_rule({ workspace = 5, monitor = "DP-1" })
hl.workspace_rule({ workspace = 7, monitor = "DP-1" })

hl.workspace_rule({ workspace = 2, monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = 4, monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = 6, monitor = "HDMI-A-1", default = true })
hl.workspace_rule({ workspace = 8, monitor = "HDMI-A-1" })

-- hl.workspace_rule({ workspace = 9, monitor = "DVI", layout = "scrolling", default = true })
-- hl.workspace_rule({ workspace = 10, monitor = "DVI", layout = "scrolling" })

hl.workspace_rule({ workspace = "special:scratchpad", layout = "scrolling", gaps_out = 25 })
''