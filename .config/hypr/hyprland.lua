-- Hyprland configuration
-- https://wiki.hypr.land/Configuring/Start/

----------------
-- Monitor --
----------------

hl.monitor({
    output = "DP-1",
    mode = "preferred",
    position = "auto",
    -- scale = 1.875,
    scale = 1.875,
})

----------------
-- Programs --
----------------

local terminal = "uwsm app -- ghostty"
local menu = "uwsm app -- rofi -show drun"

-----------------
-- Autostart --
-----------------

hl.on("hyprland.start", function()
    hl.exec_cmd("uwsm app -- nm-applet")
    hl.exec_cmd("uwsm app -- fcitx5")
    hl.exec_cmd("uwsm app -- /usr/lib/polkit-kde-authentication-agent-1")
    hl.exec_cmd("uwsm app -- ghostty")
    hl.exec_cmd("uwsm app -- librewolf")
    hl.exec_cmd("uwsm app -s b -- noctalia")
end)

-----------------
-- Appearance --
-----------------

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 5,
        border_size = 2,
        col = {
            active_border = {
                colors = { "rgba(d79921ee)", "rgba(83a598ee)" },
                angle = 45,
            },
            inactive_border = "rgba(595959aa)",
        },
        layout = "dwindle",
        allow_tearing = false,
    },

    decoration = {
        rounding = 10,
        inactive_opacity = 0.9,
        blur = {
            enabled = true,
            size = 8,
            passes = 2,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
    },

    misc = {
        force_default_wallpaper = 0,
    },

    cursor = {
        no_hardware_cursors = true,
    },
})

----------------
-- Animations --
----------------

hl.curve("easeOutQuint", {
    type = "bezier",
    points = { { 0.23, 1 }, { 0.32, 1 } },
})
hl.curve("easeInOutCubic", {
    type = "bezier",
    points = { { 0.65, 0.05 }, { 0.36, 1 } },
})
hl.curve("linear", {
    type = "bezier",
    points = { { 0, 0 }, { 1, 1 } },
})
hl.curve("almostLinear", {
    type = "bezier",
    points = { { 0.5, 0.5 }, { 0.75, 1 } },
})
hl.curve("quick", {
    type = "bezier",
    points = { { 0.15, 0 }, { 0.1, 1 } },
})

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 2.395, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 0.895, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 0.695, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 0.97, bezier = "almostLinear" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 0.605, bezier = "almostLinear" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 0.97, bezier = "almostLinear" })

-----------
-- Input --
-----------

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_rules = "",
        kb_options = "grp:win_space_toggle",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false,
        },
    },
})

-----------------
-- Keybindings --
-----------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + ALT + Q", hl.dsp.exit())
hl.bind(mainMod .. " + V", hl.dsp.window.float())
hl.bind(mainMod .. " + P", hl.dsp.window.pin())
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + W", function()
    local monitor = hl.get_active_monitor()
    if monitor == nil then
        return
    end

    hl.dispatch(hl.dsp.window.resize({
        x = monitor.width / monitor.scale,
        y = monitor.height / monitor.scale,
    }))
end)

local focusDirections = {
    left = "left",
    right = "right",
    up = "up",
    down = "down",
    h = "left",
    l = "right",
    k = "up",
    j = "down",
}

for key, direction in pairs(focusDirections) do
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ direction = direction }))
end

for workspace = 1, 10 do
    local key = workspace % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = workspace }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = workspace }))
end

local swapBindings = {
    h = { swap = "left", focus = "right" },
    j = { swap = "down", focus = "up" },
    k = { swap = "up", focus = "down" },
    l = { swap = "right", focus = "left" },
}

for key, directions in pairs(swapBindings) do
    local swapDirection = directions.swap
    local focusDirection = directions.focus
    hl.bind(mainMod .. " + SHIFT + " .. key, function()
        hl.dispatch(hl.dsp.window.swap({ direction = swapDirection }))
        hl.dispatch(hl.dsp.focus({ direction = focusDirection }))
    end)
end

local moveBindings = {
    h = "left",
    j = "down",
    k = "up",
    l = "right",
}

for key, direction in pairs(moveBindings) do
    hl.bind(mainMod .. " + ALT + " .. key, hl.dsp.window.move({ direction = direction }))
end

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + N", hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. " + E", hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. " + ALT + N", hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mainMod .. " + ALT + E", hl.dsp.focus({ workspace = "r-1" }))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.window.move({ workspace = "r+1" }))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.window.move({ workspace = "r-1" }))

hl.bind(mainMod .. " + ALT + S", hl.dsp.exec_cmd([[grim -g "$(slurp -d)" - | wl-copy]]))
hl.bind(mainMod .. " + SHIFT + ALT + S", hl.dsp.exec_cmd([[grim -g "$(slurp -d)" ~/misc/screenshots/temp.png]]))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

---------------------
-- Multimedia keys --
---------------------

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { repeating = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
