oxwm.autostart("xwallpaper --center ~/.config/oxwm/caelus.png")

local modkey = "Mod4"
local terminal = "alacritty"

local bar_font="Iosevka Nerd Font Mono:size=12"
local tags = { "1", "2", "3", "4", "5" }

local colors = {
  black      =   "#0f0f0f",
  gray_0     =   "#141514",
  gray_1     =   "#1e1f1e",
  gray_2     =   "#272a28",
  gray_3     =   "#3b403c",
  gray_4     =   "#585f5b",
  gray_5     =   "#6c756f",
  gray_6     =   "#888e7b",
  gray_7     =   "#9a9c8b",
  gray_8     =   "#b6b69a",
  gray_9     =   "#d9cdb5",
  gray_10    =   "#e3d6c9",
  white      =   "#f4decd",
  red_d      =   "#f16e65",
  red_l      =   "#f6a8a2",
  orange_d   =   "#ef934d",
  orange_l   =   "#f6be93",
  yellow     =   "#efbf71",
  green_d    =   "#7ec97e",
  green_l    =   "#b4dfb4",
  cyan_d     =   "#6fc3b5",
  cyan_l     =   "#a5d9d0",
  blue_d     =   "#71a1d6",
  blue_l     =   "#accae7",
  magenta_d  =   "#e28dc6",
  magenta_l  =   "#ecb6da",
  fg = gray_8,
  bg = black,
}

local blocks = {
  oxwm.bar.block.ram({
    format = "ram: {used}/{total} GB",
    interval = 5,
    color = colors.blue_d,
    underline = true,
  }),
  oxwm.bar.block.static({
    text = "│",
    interval = 999999999,
    color = colors.magenta_l,
    underline = false,
  }),
  --
  oxwm.bar.block.battery({
    format = "Bat: {}%",
    charging = "[+] bat: {}%",
    discharging = "[-] bat: {}%",
    full = "[f] bat: {}%",
    interval = 30,
    color = colors.green_d,
    underline = true,
  }),
};

oxwm.set_terminal(terminal)
oxwm.set_modkey(modkey)
oxwm.set_tags(tags)
oxwm.set_floating_position("top-left")

-- border
oxwm.border.set_width(2)
oxwm.border.set_focused_color(colors.orange_d)
oxwm.border.set_unfocused_color(colors.gray_4)

-- bar
oxwm.bar.set_font(bar_font)
oxwm.bar.set_blocks(blocks)
oxwm.bar.set_scheme_normal(colors.gray_8, colors.gray_1, colors.gray_3)
oxwm.bar.set_scheme_occupied(colors.orange_d, colors.gray_1, colors.orange_d)
oxwm.bar.set_scheme_selected(colors.orange_d, colors.gray_1, colors.green_d)

-- gaps
oxwm.gaps.set_enabled(true)
oxwm.gaps.set_inner(5, 5)
oxwm.gaps.set_outer(5, 5)

-- layout
oxwm.set_layout_symbol("tiling", "[T]")
oxwm.set_layout_symbol("normie", "[F]")
oxwm.set_layout_symbol("monocle", "[M]")
oxwm.set_layout_symbol("grid", "[G]")
oxwm.set_layout_symbol("tabbed", "[=]")
oxwm.set_layout_symbol("scrolling", "[>>]")

-- keybinds
oxwm.key.bind({ modkey }, "L",
  oxwm.spawn({ "sh", "-c", "alacritty -e /usr/local/bin/launcher" })
)
oxwm.key.bind({ modkey, "Shift" }, "E", oxwm.quit())
oxwm.key.bind({ modkey }, "W", oxwm.spawn({ "librewolf-bin" }))
oxwm.key.bind({ modkey, "Shift" }, "R", oxwm.restart())
oxwm.key.bind({  }, "Print", oxwm.spawn({ "sh", "-c", "scrot -s - | xclip -i -selection clipboard -t image/png" }))
oxwm.key.bind({ modkey }, "Return", oxwm.spawn_terminal())
oxwm.key.bind({ modkey }, "R", oxwm.spawn({ "sh", "-c", "st -c tux -T st -e tux" }))
oxwm.key.bind({ modkey }, "Z", oxwm.spawn({ "sh", "-c", "boomer" }))
oxwm.key.bind({ modkey }, "C", oxwm.client.kill())
oxwm.key.bind({ modkey }, "F", oxwm.client.toggle_floating())
oxwm.key.bind({ modkey }, "Space", oxwm.client.toggle_fullscreen())
oxwm.key.bind({ modkey }, "Slash", oxwm.show_keybinds())

-- layout
oxwm.key.bind({ modkey }, "T", oxwm.layout.set("tiling"))
oxwm.key.bind({ modkey }, "S", oxwm.layout.set("scrolling"))
oxwm.key.bind({ modkey }, "Y", oxwm.layout.cycle())

-- adjust master area width
oxwm.key.bind({ modkey }, "H", oxwm.set_master_factor(-5))
oxwm.key.bind({ modkey }, "V", oxwm.set_master_factor(5))

-- adjust number of master windows
oxwm.key.bind({ modkey }, "I", oxwm.inc_num_master(1))
oxwm.key.bind({ modkey }, "P", oxwm.inc_num_master(-1))

-- focus window
oxwm.key.bind({ modkey }, "K", oxwm.focus_stack(1))
oxwm.key.bind({ modkey }, "J", oxwm.focus_stack(-1))

-- window rules
oxwm.rule.add({
    class = "fsel",
    floating = true,
})

oxwm.rule.add({
    instance = "launcher",
        floating = true,
        })
